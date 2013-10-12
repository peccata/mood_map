class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @mood  = current_user.moods.build
    end
  end

  def help
  end

  def about
  end
end
