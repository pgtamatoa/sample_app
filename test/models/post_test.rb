require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@user = users(:michael)
  	@post = posts(:post1)
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "title should be present" do
  	@post.title = ""
  	assert_not @post.valid?
  end

  test "user_id should be present" do
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "content should be present" do
  	@post.content = ""
  	assert_not @post.valid?
  end

  test "title should have a maximum size" do
  	@post.title = "a"*51
  	assert_not @post.valid?
  end

  test "content should have a maximum size" do
    @post.title = "a"*1001
    assert_not @post.valid?
  end
  
end
