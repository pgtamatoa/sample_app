require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Post#creation' do
  describe "when the user is logged" do
    let(:user) { create(:user) }

    before do 
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    context "with valid informations" do
      before do
        post_article("Titre Article", "Lorem ipsum.")
      end

      it "create the post" do
        expect(page).to have_content("Titre Article")
      end
    end

    context "with invalid informations" do
      before do
        post_article("", "Lorem ipsum.")
      end

      it "does not create the post" do
        expect(page).to have_css('.alert')
      end
    end
  end

  describe "when the user is a guest" do
    before do 
      visit posts_path
    end
    it "doesn't have access to the post creation page" do
      expect(page).to_not have_content('New Post')
    end
  end

  def post_article(title, content)
    visit new_post_path
    fill_in 'Title', with: title
    fill_in 'Content', with: content
    click_button 'Create the post'
  end
end