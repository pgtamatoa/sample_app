require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Comment#creation' do

  describe "when the user is logged" do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    before do 
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    context "with valid informations" do
      before do
        post_comment('Lorem ipsum.')
      end
      
      it "create a comment" do
        expect(page).to have_text("Lorem ipsum.")
      end
    end

    context "with invalid informations" do
      before do
        post_comment('')
      end

      it "does not create a comment" do
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

  def post_comment(text)
    visit post_path(post)
    fill_in "comment[text]", with: text
    click_button 'Commenter'
  end
end