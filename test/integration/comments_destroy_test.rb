require 'test_helper'

class CommentsDestroyTest < ActionDispatch::IntegrationTest

  attr_reader :user, :post1,:comment3, :comment1

  def setup
    @user = users(:michael)
    
    @post1 = posts(:post1)

    @comment1 = comments(:comment1)
    @comment3 = comments(:comment3)
  end

  test "should delete a comment's user from the relative post page when logged" do
    log_in_as user
    get post_path(post1)
    assert_difference ->{ Comment.count }, -1 do
      delete post_comment_path(post_id: post1, id: comment1.id)
    end
  end

  test "should not delete a comment from another user" do
    log_in_as user
    get post_path(post1)
    assert_no_difference ->{ Comment.count } do
      delete post_comment_path(post_id: post1, id: comment3.id)
    end
  end

  test "should be redirect to the right page if an error occur" do
    log_in_as user
    get post_path(post1)
    Comment.stub_any_instance(:destroy, false) do
      delete_via_redirect post_comment_path(post_id: post1, id: comment1.id)
      assert_select '.alert', 'Error.'
    end
  end

end
