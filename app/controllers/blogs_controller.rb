class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    message = Blog.create! params.require(:blog).permit(:title, :content).merge(user_id: current_user.id)
    redirect_to root_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:content).merge(user_id: current_user.id)
  end
end