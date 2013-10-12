class MoodsController < ApplicationController

  def create
    @mood = current_user.moods.build(mood_params)
    if @mood.save
      flash[:success] = "Saved!"
      redirect_to root_url
    end
  end

  def destroy
  end

  private

  def mood_params
    params.require(:mood).permit(:state)
  end

end
