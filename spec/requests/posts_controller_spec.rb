require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         postsCounter: 0)
      get "/users/#{user.id}/posts"
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should have a succesfull connection' do
      expect(response).to have_http_status(:ok)
    end

    it ' should return place holder' do
      expect(response.body).to include('All posts of the user')
    end
  end
end

RSpec.describe PostsController, type: :request do
  describe 'GET show' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         postsCounter: 0)
      post = Post.create(user:user, title: 'Hello', text: 'This is my first post', likesCounter: 0, commentsCounter: 0)
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should have a succesfull connection' do
      expect(response).to have_http_status(:ok)
    end

    it ' should return place holder' do
      expect(response.body).to include('show posts of the user')
    end
  end
end
