class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[edit, update, destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to request.referrer, notice: "Comment was successfully added."
    else
      redirect_to request.referrer, alert: "Comment wasn't saved. #{@comment.errors.full_messages.first}"
    end
  end

  def update
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer, status: :see_other, notice: "Comment was successfully deleted."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :recipe_id)
  end
end
