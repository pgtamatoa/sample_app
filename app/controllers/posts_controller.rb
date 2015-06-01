class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    if logged_in?
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    else
      redirect_to posts_path
    end
  end

  def post_params 
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :user_id)
  end

end
