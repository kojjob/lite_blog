class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
