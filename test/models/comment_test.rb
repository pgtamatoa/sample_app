require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = comments(:comment1)

  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post_id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "comment should have a maximum size" do
    @comment.text = "a"*141
    assert_not @comment.valid?
  end

end
