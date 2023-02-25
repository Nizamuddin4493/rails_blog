require 'rails_helper'

RSpec.describe Post, type: :model do
  # it 'testing Posts' do
  # expect(Post.new).to be_valid
  # end
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', postsCounter: 0)
    @post = Post.create(title: 'Hello', text: 'Hello Rails', user: @user, commentsCounter: 0, likesCounter: 0)
    @comments = []
  end

  it 'Should be present title to Hello' do
    @post.title = 'Hello'
    expect(@post).to be_valid
  end

  it 'comments_counter should be an integer and sould be  >= 0 ' do
    @post.commentsCounter = 0
    expect(@post).to be_valid
  end

  it 'likes_counter should be an integer and sould be  >= 0' do
    @post.likesCounter = 0
    expect(@post).to be_valid
  end

  it 'should return the five most recent comments' do
    result = @post.five_most_recent_comments
    expect(result).to eq(@comments)
  end

  it 'Should updates the postsCounter' do
    @post.send(:update_posts_counter)
    expect(@user.reload.postsCounter).to eq(1)
  end
end
