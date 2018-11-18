class CreateSeos < ActiveRecord::Migration[5.2]
  def change
    create_table :seos do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.references :seoable, polymorphic: true

      t.timestamps
    end
  end
end
