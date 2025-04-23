class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @video, notice: 'Comment was successfully created.'
    else
      redirect_to @video, alert: 'Error creating comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end