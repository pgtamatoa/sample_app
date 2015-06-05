class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post_id}"
    end
  end

  def comment_params 
    params.require(:comment).permit(:text,:user_id,:post_id).merge({
      user_id: current_user.id
    })
  end

end
