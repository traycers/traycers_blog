class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, :post, presence: true
  validates :rating, length: { in: 0..100 }
end
