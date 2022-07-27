class LikesController < ApplicationController
  def create
    if current_user.liked?(params[:likeable_id])
      render json: {"error_message": "Stop using API calls you little bastard!"}, status: :forbidden
    else
      current_user.likes.create(like_params)
      redirect_to request.referrer
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if current_user.liked?(@like.likeable_id)
      @like.destroy
      redirect_to request.referrer, status: :see_other
    else
      render json: {"error_message": "Stop using API calls you little bastard!"}, status: :forbidden
    end
  end

  private

  def like_params
    params.permit(:likeable_id, :likeable_type)
  end
end
