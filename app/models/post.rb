class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes

  def upadate_countr
    if user.posts_countr
      user.posts_counter += 1
    else
      user.posts_counter = 1
    end
    user.save
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
