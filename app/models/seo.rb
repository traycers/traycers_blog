class Seo < ApplicationRecord
  belongs_to :seoable, polymorphic: true

  validates :title, length: { in: 3..70 }
  validates :description, length: { in: 5..160 }

end
