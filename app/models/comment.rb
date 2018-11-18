class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one  :seo, as: :seoable

  validates :body, length: { in: 5..100 }
  validates :user, :post, presence: true
end
