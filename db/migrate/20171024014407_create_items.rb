class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.float :price
      t.integer :user_id
      t.string :category
      t.text :image_data

      t.timestamps
    end
  end
end
