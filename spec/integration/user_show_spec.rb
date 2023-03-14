require 'rails_helper'

RSpec.describe 'Test for the user show page', type: :system do
  describe ' Check the right content for user show page' do
    before(:each) do
      @new_user = User.create(name: 'soe sandar win',
                              photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp',
                              bio: 'software engineer', postsCounter: 0)
      @post_one = Post.create(user: @new_user, title: 'Hello', text: 'this is my first post', commentsCounter: 0,
                              likesCounter: 0)
      @post_two = Post.create(user: @new_user, title: 'jobs', text: 'I am gonna get a jon in may', commentsCounter: 0,
                              likesCounter: 0)
      @post_three = Post.create(user: @new_user, title: 'life', text: 'i will get out of this life',
                                commentsCounter: 0, likesCounter: 0)
      @post_four = Post.create(user: @new_user, title: 'relocation', text: 'i will go to singapore',
                               commentsCounter: 0, likesCounter: 0)
      @post_five = Post.create(user: @new_user, title: 'Nizam', text: 'I will visit the Europe', commentsCounter: 0,
                               likesCounter: 0)
    end

    it 'User should see the other user\'s profile picture' do
      visit user_path(@new_user)
      expect(page).to have_selector('img')
    end

    it 'User should see the user\'s username' do
      visit user_path(@new_user)
      expect(page).to have_content('soe sandar win')
    end

    it 'User should see the number of posts the user has written' do
      visit user_path(@new_user)
      expect(page).to have_content('soe sandar win')
    end

    it 'User should see the see the user\'s bio' do
      visit user_path(@new_user)
      expect(page).to have_content('software engineer')
    end

    it 'User should see the see the user\'s recent posts' do
      visit user_path(@new_user)
      expect(page).to have_content('relocation')
      expect(page).to have_content('life')
    end

    it 'User should see the see  a button that lets me view all of a user\'s posts' do
      visit user_path(@new_user)
      expect(page).to have_content('See all posts')
    end

    it 'User click see all posts, it redirects me to the user\'s post\'s index page' do
      visit user_path(@new_user)
      click_link 'See all posts'
      expect(page).to have_content('relocation')
    end
  end
end
