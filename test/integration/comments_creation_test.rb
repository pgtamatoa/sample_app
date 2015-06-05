require 'test_helper'

class CommentsCreationTest < ActionDispatch::IntegrationTest
  
  attr_accessor :user#, :post

  def setup
    @user = users(:michael)
    @post = posts(:post1)
  end

  test "should display the comments under the article commented with valid information login" do
    log_in_as user
    get post_path(@post.id)
    assert_select 'h1', "#{@post.title}"
    assert_select 'p', "This article isn't commented."
    #debugger
    assert_difference 'Post.find(@post.id).comments.count', 1 do
     post_via_redirect post_comments_path(post_id: @post.id), comment: { 
       text: 'Lorem ipsum',
       post_id: "#{@post.id}"
     }
    end
    assert_select 'p', "Lorem ipsum"
    get posts_path
    assert_select 'h3', "#{@post.title}"
    assert_select 'pluralize(Post.find(@post.id).comments.count, "commentaire")', 1
  end

  test "should display the form under the article commented with valid information login" do    
    log_in_as user
    get post_path(@post.id)
    assert_select 'form', 1
  end

  test "shouldn't display the comment form with invalid information login" do
    get post_path(@post.id)
    assert_select 'form', 0
  end

end
