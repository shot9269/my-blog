class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
   if root_path
    @blogs = Blog.where(genre_id: params[:genre_id]).order(created_at: "DESC")
   end
  end

  def new
    @blog = Blog.new
  end

  def create
    message = Blog.create! params.require(:blog).permit(:title, :content,:image,:genre_id).merge(user_id: current_user.id)
    redirect_to root_path
  end

  def show
    @blog = Blog.find(params[:id])
    render json:{blog: @blog}
  end
  private
  def blog_params
    params.require(:blog).permit(:title,:content,:image,:genre_id).merge(user_id: current_user.id)
  end
end
