require 'rails_helper'

RSpec.describe UserController, type: :request do
  describe 'GET index' do
    before(:example) do
      get '/user'
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should have a succesfull connection' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return place holder' do
      expect(response.body).to include('List of all users')
    end
  end
end

RSpec.describe UserController, type: :request do
  describe 'GET show' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         postsCounter: 0)
      get "/user/#{user.id}"
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should have a succesfull connection' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return place holder' do
      expect(response.body).to include('users info')
    end
  end
end
