class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video
  
  def create
    current_user.reactions.where(video: @video).destroy_all
    
    @reaction = current_user.reactions.build(
      video: @video,
      reaction_type: params[:reaction_type]
    )
    
    if @reaction.save
      respond_to do |format|
        format.html { redirect_to @video }
        format.js # renderiza create.js.erb
      end
    else
      redirect_to @video, alert: 'Unable to record your reaction.'
    end
  end
  
  def destroy
    @reaction = current_user.reactions.find_by(video: @video)
    @reaction.destroy if @reaction
    
    respond_to do |format|
      format.html { redirect_to @video }
      format.js # renderiza destroy.js.erb
    end
  end
  
  private
  
  def set_video
    @video = Video.find(params[:video_id])
  end
end
