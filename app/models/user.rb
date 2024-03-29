class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  validates :name, presence: true
  validates :postsCounter,
            numericality: { only_interger: true, greater_than_or_equal_to: 0,
                            message: 'Must be integer and greater than or Equal to Zero.' }, allow_nil: true

  def last_3_posts
    posts.last(3)
  end
end
