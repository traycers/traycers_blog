class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: { in: 3..20 }
  validates :email, email: true

end
