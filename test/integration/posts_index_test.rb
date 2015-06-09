require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest

  attr_accessor :post1

  def setup
    @post1 = posts(:post1)
  end

  test "post when there are more than 5 articles" do
    get posts_path
    
    assert_template 'posts/index'
    assert_select '.post', Post.page.count
  end

  test "post when there aren't" do
    Post.delete_all

    get posts_path

    assert_template 'posts/index'
    assert_select "p", "There aint no post."
  end

  test "should get the right number of comments" do
    get posts_path
    assert_select '.post .bg-info', "#{post1.comments.count} commentaires"
  end

end
