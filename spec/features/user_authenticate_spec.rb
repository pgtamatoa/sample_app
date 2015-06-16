require 'spec_helper'
require 'rails_helper'
require 'support/helpers'

RSpec.feature 'authenticate' do
  before do 
    login_as(email: user.email, password: user.password) 
  end

  context "with valid information" do
    let (:user) { create(:user) }

    it "display Account" do
      expect(page).to have_content('Account')
    end
  end

  context "with invalid information" do
    let(:user) { build(:user, name: '') }

    it "display error" do
      expect(page).to have_content("Invalid email/password combination")
    end
  end

  describe "logout after being login" do
    let(:user) { create(:user) }
    
    it "display login button" do
      click_link 'Log out', visible: false
      expect(page).to have_content('Log in')
    end
  end
end