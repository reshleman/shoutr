class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :content, null: false
      t.references :user, null: false

      t.timestamps null: false
    end

    add_index :shouts, :user_id
  end
end
