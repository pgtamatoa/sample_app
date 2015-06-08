require 'test_helper'

class PostsShowTest < ActionDispatch::IntegrationTest

  attr_accessor :post1

  def setup
    @post1 = posts(:post1)
  end

  test "should get the article page" do
    get post_path(post1.id)
    assert_select 'h1', post1.title
  end

end
