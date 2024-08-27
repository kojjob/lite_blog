class Follow < ApplicationRecord
  belongs_to :follower
  belongs_to :followed

  validates :follower_id, uniqueness: { scope: :followed_id }
end
