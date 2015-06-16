require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature 'Post destroy' do
  context "when the post is the user property" do
    let(:user1) { create(:user) }
    let!(:post1) { create(:post, user: user1) }

    before do
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "display the Delete link" do
      expect(page).to have_css("#post_#{post1.id} a")
    end

    it "display there aint no post after having click on delete" do
      find("#post_#{post1.id} a").click
      expect(page).to have_text('There aint no post.')
    end
  end

  context "when the post is not the user property" do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let!(:post1) { create(:post, user: user2) }

    before do 
      login_as(email: user1.email, password: user1.password) 
      visit_index_and_click_on_an_article
    end

    it "does not display the Delete link" do
      expect(page).to_not have_css("#post_#{post1.id} a")
    end
  end

  context "when the user is a guest" do
    let!(:post1) { create(:post) }
    before do
      visit_index_and_click_on_an_article
    end
    
    it "does not display the Delete link" do
      expect(page).to_not have_css("#post_#{post1.id} a")
    end
  end
end