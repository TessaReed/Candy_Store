class Item < ApplicationRecord
  include ImageUploader[:image]
  # belongs_to :user
  has_many :charges
end
