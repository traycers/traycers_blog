class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post
  has_one  :seo, as: :seoable, dependent: :destroy

  # validates :name, length: { in: 3..20 }
  validates :name, :email, uniqueness: true
  validates :email, email: true

end
