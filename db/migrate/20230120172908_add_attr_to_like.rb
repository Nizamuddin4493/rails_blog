class AddAttrToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :authorId, :integer
    add_column :likes, :postId, :integer
  end
end
