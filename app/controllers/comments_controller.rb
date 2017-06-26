class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])

    @comment = @project.comments.build(pledge_params)
    @comment.user = current_user

    if @comment.save
      redirect_to project_url(@project), notice: "Comment Added!"
    else
      flash.now[:alert] = @comment.errors.full_messages.first
      render 'projects/show'
    end
  end

  private

  def pledge_params
    params.require(:comment).permit(:comment_text)
  end
end
