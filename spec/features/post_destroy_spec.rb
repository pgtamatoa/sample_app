require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature 'Post destroy' do
  context "when the post is the user property" do
    let(:user1) { create(:user) }

    before do
      create(:post, user: user1) 
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "display the Delete link" do
      expect(page).to have_css("small.post_destroy a")
    end

    it "display there aint no post after having click on delete" do
      find("small.post_destroy a").click
      expect(page).to have_text('There aint no post.')
    end
  end

  context "when the post is not the user property" do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    before do 
      create(:post, user: user2)
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "does not display the Delete link" do
      expect(page).to_not have_css("small.post_destroy a")
    end
  end

  context "when the user is a guest" do
    before do
      create(:post) 
      visit_index_and_click_on_an_article
    end
    
    it "does not display the Delete link" do
      expect(page).to_not have_css("small.post_destroy a")
    end
  end
end