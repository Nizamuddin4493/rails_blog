require 'rails_helper'

RSpec.describe 'user show page testing', type: :system do
  context ' Checking content for user show page' do
    before(:each) do
      @user = User.create(name: 'Nizam', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'web developer', postsCounter: 0)
    end

    it 'User should see the other user\'s profile picture' do
      visit users_path
      expect(page).to have_content('Nizam')
    end

  end
end