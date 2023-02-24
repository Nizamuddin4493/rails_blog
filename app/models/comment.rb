class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    if post.commentsCounter
      post.commentsCounter += 1
    else
      post.commentsCounter = 1
    end
    post.save
    post.save
  end
end
