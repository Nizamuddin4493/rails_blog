class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    if post.likesCounter
      post.likesCounter += 1
    else
      post.likesCounter = 1
    end
    post.save
    post.save
  end
end
