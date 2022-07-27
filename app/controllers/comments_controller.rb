class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment.recipe), notice: "Comment was successfully added."
    else
      redirect_to recipe_path(@comment.recipe), alert: "Comment wasn't saved. #{@comment.errors.full_messages.first}"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to recipe_path(@comment.recipe), notice: "Comment was successfully updated."
    else
      redirect_to edit_comment_path(@comment), alert: "Comment wasn't saved. #{@comment.errors.full_messages.first}"
    end
  end

  def destroy
    @comment.destroy
    redirect_to recipe_path(@comment.recipe), status: :see_other, notice: "Comment was successfully deleted."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :recipe_id)
  end
end
