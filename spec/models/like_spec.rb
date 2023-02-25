require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', postsCounter: 0)
    @post = Post.create(user: @user, title: 'Hello', text: 'Hello Rails', commentsCounter: 0, likesCounter: 0)
    @like = Like.create(post: @post, user: @user)
  end

  it 'Should updates the likesCounter' do
    @like.send(:update_likes_counter)
    expect(@post.reload.likesCounter).to eq(1)
  end
end
