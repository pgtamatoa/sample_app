require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature 'Comment destroy' do
  context "when the comment is the user property" do
    let(:user1) { create(:user) }
    let(:post1) { create(:post) }

    before do
      create(:comment, user: user1, post: post1) 
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "display the Delete link" do
      expect(page).to have_css("small.comment_destroy a")
    end

    it "display there aint no post after having click on delete" do
      find("small.comment_destroy a").click
      expect(page).to have_text('No comments.')
    end
  end

  context "when the comment is not the user property" do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:post1) { create(:post) }

    before do 
      create(:comment, user: user2, post: post1) 
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "does not display the Delete link" do
      expect(page).to_not have_css("small.comment_destroy a")
    end
  end

  context "when the user is a guest" do
    let(:post1) { create(:post) }

    before do
      create(:comment, post: post1) 
      visit_index_and_click_on_an_article
    end
    
    it "does not display the Delete link" do
      expect(page).to_not have_css("small.comment_destroy a")
    end
  end
end