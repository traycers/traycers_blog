class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :header, index: { unique: true }
      t.text :body, default: 'TODO: to fill this article!'
      t.integer :type, default: 0
      t.boolean :visible, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
