class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  def update_counter
    if post.likes_counter
      post.likes_counter += 1
    else
      post.likes_counter = 1
    end
    post.save
    post.save
  end
end
