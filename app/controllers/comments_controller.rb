class CommentsController < ApplicationController
  
  before_action :redirect_guest_user, unless: :logged_in? 

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])

    if @comment.destroy
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post), flash: {danger: "Error."}
    end
  end

  private

  def comment_params 
    params.require(:comment).permit(:text,:user_id,:post_id).merge({
      user_id: current_user.id
    })
  end

end
