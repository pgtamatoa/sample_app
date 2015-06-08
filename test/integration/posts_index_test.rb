require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest

  attr_accessor :post1

  def setup
    @post1 = posts(:post1)
    posts(:post2)
  end

  test "post when there are 2 articles" do
    get posts_path
    
    assert_template 'posts/index'
    assert_tag tag: 'div', attributes: { class: "posts" }, 
      children: { count: 2, only: { tag: 'div', attributes: { class: "post" }} }
  end

  test "post when there aren't" do
    Post.delete_all

    get posts_path

    assert_template 'posts/index'
    assert_select "p", "There aint no post."
  end

  test "should get the right number of comments" do
    get posts_path
    assert_select 'h3', Post.count
  end

end
