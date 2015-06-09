require 'test_helper'

class PaginationTest < ActionDispatch::IntegrationTest
  
  def setup
    6.times do |i|
      posts("post#{i+1}")
    end
  end

  test "should have the right number of post per page" do
    get posts_path
    assert_select '.post', Post.page.count

    get posts_path(page: 2)
    assert_select '.post', Post.page(2).count
  end

end
