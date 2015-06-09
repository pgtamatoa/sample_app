class PostsController < ApplicationController
  
  before_action :redirect_guest_user, unless: :logged_in? 
  skip_before_action :redirect_guest_user, only: [:index, :show]

  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    #Comment.destroy_all(post.comments)
    Post.destroy(:id)
    redirect_to posts_path
  end

  def post_params 
    params.require(:post).permit(:title, :content, :user_id).merge({
      user_id: current_user.id
    })
  end

 
  private
 
  def redirect_guest_user
      redirect_to login_path, flash: { error: "You must be logged in to access this section" }
  end


end
