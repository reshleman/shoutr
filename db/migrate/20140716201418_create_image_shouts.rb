class CreateImageShouts < ActiveRecord::Migration
  def change
    create_table :image_shouts do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
