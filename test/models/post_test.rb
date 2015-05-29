require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@user = users(:michael)
  	@post = Post.new( 
  		title: "First Post",
  		content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis sed eum vitae sequi id magni, debitis hic culpa, similique blanditiis asperiores fugit ut reprehenderit veniam doloremque veritatis perspiciatis commodi consequuntur?",
  		user_id: @user.id
  		)
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
  
end
