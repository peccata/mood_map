class StaticPagesController < ApplicationController
  def home
    @mood = current_user.moods.new if signed_in?
  end

  def help
  end

  def about
  end
end
