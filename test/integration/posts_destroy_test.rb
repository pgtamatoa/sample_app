require 'test_helper'

class PostsDestroyTest < ActionDispatch::IntegrationTest

  attr_reader :user, :post1, :post7
  def setup
    @user = users(:michael)
    @post1 = @user.posts.first
    @post7 = posts(:post7)    
  end
  
  test "should delete a comment's user from the relative post page when logged" do
    log_in_as user 
  end

  test "should delete a post's user and all his comments when logged" do
    log_in_as user
  end 

  test "should not delete a comment or a post if not logged" do
    get post_path(post1)

  end

  test "should not delete a comment from another user" do
    log_in_as user
    get post_path(post1)
  end

  test "should not delete a post from another user" do
    log_in_as user
    get post_path(post1)
    #assert_template 'posts/destroy'
  end

end
