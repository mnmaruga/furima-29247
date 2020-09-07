class Item < ApplicationRecord
  belongs_to :user
  has_one :sale
  has_one_attached :image
  belongs_to_active_hash :item_state
  belongs_to_active_hash :deliver
end
