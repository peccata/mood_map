class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_nickname!(params[:id])
    @moods = @user.moods
  end

end
