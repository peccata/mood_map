class MoodsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def create
    @mood = current_user.moods.build(mood_params)
    if @mood.save
      flash[:success] = "Saved!"
      redirect_to root_url
    end
  end

  def destroy
    @mood.destroy
    redirect_to root_url
  end

  private

  def mood_params
    params.require(:mood).permit(:state)
  end

  def correct_user
    @mood = current_user.moods.find_by(id: params[:id])
    redirect_to root_url if @mood.nil?
  end

end