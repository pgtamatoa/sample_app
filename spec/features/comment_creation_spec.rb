require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature "Comment creation" do
  context "when the user is logged" do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    before do 
      login_as(email: user.email, password: user.password) 
      visit post_path(post)
    end

    describe "with valid information" do
      let(:text) { "Lorem ipsum."}

      before do
        fill_and_submit_with(text: text)
      end

      it "create a comment" do
        expect(page).to have_text(text)
      end
    end

    describe "with invalid information" do
      before do
        fill_and_submit_with(text: '')
      end

      it "display an error message" do
        expect(page).to have_css('.alert')
      end
    end
  end

  context "when the user is a guest" do
    before do 
      visit posts_path
    end

    it "doesn't have access to the post creation page" do
      expect(page).to_not have_content('New Post')
    end
  end

  def fill_and_submit_with(param)
    fill_in "comment[text]", with: param[:text]
    click_button 'Commenter'
  end
end