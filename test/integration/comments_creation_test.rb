require 'test_helper'

class CommentsCreationTest < ActionDispatch::IntegrationTest
  attr_accessor :user, :article

  def setup
    @user = users(:michael)
    @article = posts(:post2)
  end

  test "when we comment an article, should display the new comment" do
    log_in_as user

    get post_path(article.id)

    assert_select '.list-comments p', "No comments."

    assert_difference ->{ Post.find(article.id).comments.count }, 1 do
      post_via_redirect post_comments_path(post_id: article.id), comment: {
        text: 'Lorem ipsum',
        post_id: article.id
      }
    end

    assert_select '.list-comments p i', "Lorem ipsum"
    # FIXME should not be here
    get posts_path
    assert_select 'h3', article.title
    assert_select 'pluralize(Post.find(article.id).comments.count, "commentaire")', 1
  end

  test "should display the form under the article commented with valid information login" do
    log_in_as user
    get post_path(article.id)

    assert_select 'form#new_comment', 1
  end

  test "shouldn't display the comment form with guest user" do
    get post_path(article.id)

    assert_select 'form#new_comment', 0
  end
end
