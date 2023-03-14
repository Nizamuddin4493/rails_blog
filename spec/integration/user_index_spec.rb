require 'rails_helper'

RSpec.describe 'user show page testing', type: :system do
  context ' Checking content for user show page' do
    before(:each) do
      @user = User.create(name: 'Nizam', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp',
                          bio: 'web developer', postsCounter: 0)
    end

    it 'User should see the other user\'s profile picture' do
      visit users_path
      expect(page).to have_content('Nizam')
    end

    it 'profile picture for each user.' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'the number of posts each user has written' do
      visit users_path
      expect(page).to have_content('Number of Posts:')
    end

    it 'When I click on a user, I am redirected to that user show page' do
      visit users_path
      sleep(2)
      click_link 'Nizam'
      expect(page).to have_content('web developer')
    end
  end
end
