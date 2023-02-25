class ChangePostsCounterToPostsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :PostsCounter, :postsCounter
  end
end
