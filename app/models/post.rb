class Post < ApplicationRecord
  belongs_to :user
  # Заготовка для генерации html из markdown содержимого поста
  enum type: %i[text md]
end
