class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes

  validates :post, length: {maximum: 250}
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def upadate_countr
    if user.postsCountr
      user.postsCounter += 1
    else
      user.postsCounter = 1
    end
    user.save
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
