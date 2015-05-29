require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest

  def setup
    posts(:article)
    posts(:article2)
  end

  test "post when there are 2 articles" do
    get posts_path
    assert_template 'posts/index'
    assert_tag tag:'div', attributes: {class: "posts"}, 
      children:{count: 2, only: {tag: 'div', attributes: {class: "post"}} }
  end


  test "post when there aren't" do
    Post.delete_all
    get posts_path
    assert_template 'posts/index'
    assert_select "p", "There aint no post in the DB."
  end

end
