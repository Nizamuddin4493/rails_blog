class AddAttrToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :PostsCounter, :integer
  end
end
