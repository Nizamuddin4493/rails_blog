class AddAttrToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorId, :integer
    add_column :comments, :postId, :integer
    add_column :comments, :text, :text
  end
end
