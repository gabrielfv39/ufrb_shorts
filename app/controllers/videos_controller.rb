class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  
  def index
    if params[:category].present?
      @videos = Video.where(category: params[:category])
    elsif params[:search].present?
      @videos = Video.where("title LIKE ? OR synopsis LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @videos = Video.all
    end
  end
  
  def show
  end
  
  def new
    @video = Video.new
  end
  
  def edit
  end
  
  def create
    @video = Video.new(video_params)
    @video.user = current_user

    
    if params[:minutes].present? || params[:seconds].present?
      minutes = params[:minutes].to_i
      seconds = params[:seconds].to_i
      @video.duration = "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
    end

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if params[:minutes].present? || params[:seconds].present?
      minutes = params[:minutes].to_i
      seconds = params[:seconds].to_i
      params[:video][:duration] = "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
    end

    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
  @video = Video.find(params[:id])
  @video.destroy
  redirect_to videos_path, notice: 'Video was successfully destroyed.'
end
  
  private
  
  def set_video
    @video = Video.find(params[:id])
  end
  
  def check_owner
    unless current_user == @video.user
      redirect_to videos_path, alert: "You can only edit or delete your own videos."
    end
  end
  
  def video_params
    params.require(:video).permit(:title, :synopsis, :youtube_url, :duration, :cast, :crew, :category)
  end
end
