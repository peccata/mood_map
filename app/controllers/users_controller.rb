class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_nickname!(params[:id])
    @moods = @user.moods
    gon.moods = @moods.map { |x| { Date: x.created_at, Mood: x.state} }
  end

end
