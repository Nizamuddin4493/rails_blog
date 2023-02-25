class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def five_most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    user.update(postsCounter: user.posts.count)
  end
end
