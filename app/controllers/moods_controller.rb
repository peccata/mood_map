class MoodsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @mood = current_user.moods.build(mood_params)
    if @mood.save
      flash[:success] = "Saved!"
      redirect_to root_url
    else
      flash[:error] = ":("
      redirect_to root_url
    end
  end

  def destroy
    @mood.destroy
    redirect_to user_url(current_user)
  end

  private

  def mood_params
    params.require(:mood).permit(:state, :latitude, :longitude)
  end

  def correct_user
    @mood = current_user.moods.find_by_timestamp!(params[:id]) or redirect_to(root_url)
  end
end
