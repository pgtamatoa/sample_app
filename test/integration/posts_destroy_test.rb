require 'test_helper'

class PostsDestroyTest < ActionDispatch::IntegrationTest

  attr_reader :user, :post1, :post7

  def setup
    @user = users(:michael)

    @post1 = posts(:post1)
    @post7 = posts(:post7)

  end

  test "should delete a post's user and all his comments when logged" do
    log_in_as user
    get post_path(post1)
    assert_difference -> { post1.comments.count}, -3 do
      delete post_path(id: post1.id)
    end
  end

  test "should not delete a post from another user" do
    log_in_as user
    get post_path(post7)
    assert_no_difference ->{ Post.count } do
      delete post_path(post7)
    end
  end

end
