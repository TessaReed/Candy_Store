class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.decimal :price
      t.string :stripe_token

      t.timestamps
    end
  end
end
