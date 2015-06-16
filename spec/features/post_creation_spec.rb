require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature 'Post creation' do
  context "when the user is logged" do
    let(:user) { create(:user) }

    before do
      login_as(email: user.email, password: user.password) 
      visit new_post_path
    end

    describe "with valid information" do
      let(:title) { "Titre Article" }

      before do
        fill_and_submit_with(title: title, content: "Lorem ipsum.")
      end

      it "display the article created" do
        expect(page).to have_content(title)
      end
    end

    describe "with invalid information" do
      before do
        fill_and_submit_with(title: "", content: "Lorem ipsum.")
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
    fill_in 'Title', with: param[:title]
    fill_in 'Content', with: param[:content]
    click_button 'Create the post'
  end
end