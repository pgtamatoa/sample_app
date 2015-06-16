module Helpers
  RSpec.configure do |c|
    c.include Helpers
  end

  def login_as(param)
    visit login_path
    fill_in 'Email', with: param[:email]
    fill_in 'Password', with: param[:password]
    click_button 'Log in'
  end
end