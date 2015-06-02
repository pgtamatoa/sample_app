class PostsController < ApplicationController
  
  before_action :redirect_guest_user, unless: :logged_in? 
  skip_before_action :redirect_guest_user, only: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
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
