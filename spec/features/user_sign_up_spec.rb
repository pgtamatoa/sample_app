require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Signs up' do
  before do
    visit signup_path

    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Confirmation', with: user.password_confirmation

    click_button 'Create my account'
  end

  context 'with valid information' do
    let (:user) { build (:user) }
    it 'display the user page' do
      expect(page).to have_content('Account')
    end
  end

  context 'with invalid information' do
    let (:user) { build(:user, name: '') }

    it "display 'error'" do
      expect(page).to have_css('.alert')
    end
  end
end