class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :follower_relationships, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_relationships, foreign_key: :follower_id, class_name: "Follow"
  has_many :followeds, through: :followed_relationships, source: :followed

  def follow(user)
    followed_relationships.create(followed: user)
  end

  def unfollow(user)
    followed_relationships.find_by(followed: user).destroy
  end

  def following?(user)
    followeds.include?(user)
  end
end
