class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :charges, :items_id, :item_id
  end
end
