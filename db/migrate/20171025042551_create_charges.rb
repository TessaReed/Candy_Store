class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.references :user, foreign_key: true
      t.references :items, foreign_key: true
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
