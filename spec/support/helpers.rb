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

  def visit_index_and_click_on_an_article
    visit posts_path
    click_link 'Titre article'
  end
end