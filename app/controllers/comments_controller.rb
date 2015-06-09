class CommentsController < ApplicationController
  
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
    @comment = Comment.find(param[:i])
    Comment.destroy(:id)
    redirect_to post_path(@comment.post)
  end

  def comment_params 
    params.require(:comment).permit(:text,:user_id,:post_id).merge({
      user_id: current_user.id
    })
  end

end
