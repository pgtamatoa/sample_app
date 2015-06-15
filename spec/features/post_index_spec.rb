require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Post#index' do
  context 'when there are posts' do
    before do
      create_list(:post, 6)
      visit posts_path
    end

    it 'display the right number of post per page' do
      expect(page).to have_text('Titre article', count: 5)
      click_link 'Next ›'
      expect(page).to have_text('Titre article', count: 1)      
    end
  end

  context 'when there aint no posts' do
    it "dipslay there aint no posts" do
      visit posts_path
      expect(page).to have_text('There aint no post.')
    end
  end

  context 'when click on a Title name' do
    before do
      create(:post)
      visit posts_path
      click_link 'Titre article'
    end
    
    it 'display the article page' do
      expect(page).to have_css('h1', text: 'Titre article')
    end
  end
end