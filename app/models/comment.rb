class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    if post.comments_counter
      post.comments_counter += 1
    else
      post.comments_counter = 1
    end
    post.save
    post.save
  end
end
