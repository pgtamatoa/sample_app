class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(@comment.post_id)

    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render 'posts/show'
    end

  end

  def comment_params 
    params.require(:comment).permit(:text,:user_id,:post_id).merge({
      user_id: current_user.id
    })
  end

end
