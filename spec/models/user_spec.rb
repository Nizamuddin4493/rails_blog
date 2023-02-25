require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', postsCounter: 0)
    @posts = []
  end

  it 'This should be present' do
    @user.name = 'Halle'
    expect(@user).to be_valid
  end

  it 'PostsCounter is an integer and greater then or equal to zero' do
    @user.postsCounter = 0
    expect(@user).to be_valid
  end

  it 'Return the last 3 posts' do
    result = @user.last_3_posts
    expect(result).to eq(@posts)
  end

  it 'The user name must not be blank' do
    @user.name = ' '
    expect(@user).to be_invalid
  end

  it 'The Post Counter must not be blank' do
    @user.postsCounter = ' '
    expect(@user).to be_invalid
  end
end
