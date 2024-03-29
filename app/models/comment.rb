class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true, length: { maximum: 250 }

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
