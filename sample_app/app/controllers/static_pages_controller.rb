class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @micropost = current_user.microposts.build
  end

  def help
  end

  def about
  end
end
