class AddAttrsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photo, :string
    add_column :users, :bio, :string
    add_column :users, :poostsCounter, :integer
  end
end
