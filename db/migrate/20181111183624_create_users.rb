class CreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|

      t.with_options index: { unique: true } do
        string :name
        string :email
      end

      t.with_options default: false do
        boolean :creator
        boolean :moderator
        boolean :banned
      end

      t.timestamps
    end

  end

end # CreateUsers 
