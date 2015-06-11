require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  attr_reader :post1, :comment

  def setup
    @post1 = posts(:post1)
    @comment = comments(:comment1)
  end

  test "should be valid" do
    assert comment.valid?
  end

  test "user_id should be present" do
    comment.user_id = nil
    assert_not comment.valid?
  end

  test "post_id should be present" do
    comment.post_id = nil
    assert_not comment.valid?
  end

  test "comment should have a maximum size" do
    comment.text = "a"*141
    assert_not comment.valid?
  end

  test "should delete all the comments of a post's user when logged" do
    assert_difference -> { post1.comments.count }, -3 do
      post1.destroy
    end
  end

end
