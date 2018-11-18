class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # Заготовка для генерации html из markdown содержимого поста
  # возможно стоит добавить html & css?
  enum content: %i[text md]

  validates :header, :body, presence: true
  validates :header, uniqueness: true
  validates :header, length: { in: 5..100 }
  validates :body, length: { minimum: 5, maximum: 1_000 }

end
