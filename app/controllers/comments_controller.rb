class CommentsController < ApplicationController
  before_action :load_parent

  def create
    @comment = @commentable.comments.build(comment_params)
  end

  def destroy
  end

  private
  def load_parent
    klass = [Project, User].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
