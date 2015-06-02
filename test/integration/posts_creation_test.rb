require 'test_helper'

class PostsCreationTest < ActionDispatch::IntegrationTest
  
  attr_accessor :user

  def setup
    @user = users(:michael)
  end

  test "should create the post with valid information login" do
    signin_as user
    assert_difference 'Post.count', 1 do
      post_via_redirect posts_path, post: { title:  'test',
                          content: 'Lorem ipsum' }
    end
    assert_template 'posts/index'
  end

  test "should not create the post with invalid information login" do
    signin_as user
    assert_no_difference 'Post.count' do
        post posts_path, post: {  title:  "",
                                  content: "" }
    end
    assert_template 'posts/new'
    assert flash.empty?
  end


  test "should not access to the posts/new page logout" do
    get_via_redirect new_post_path
    assert_template 'sessions/new'
  end

  def signin_as user
    get login_path
    post login_path, session: { email: user.email, password: 'password' }
    assert is_logged_in?
    get new_post_path
    assert_template 'posts/new'
  end

end
