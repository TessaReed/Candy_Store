json.extract! item, :id, :price, :user_id, :category, :image_data, :created_at, :updated_at
json.url item_url(item, format: :json)
