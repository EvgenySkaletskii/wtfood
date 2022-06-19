class LikesController < ApplicationController
  def create
    current_user.likes.create(like_params)
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end

  private

  def like_params
    params.permit(:likeable_id, :likeable_type)
  end
end
