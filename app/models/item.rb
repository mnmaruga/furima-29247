class Item < ApplicationRecord
  belongs_to :user
  has_one :sale
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deli_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :deli_day

  validates :image, :item, :detail, :category, :status, :deli_fee, :area, :deli_day, :price, presence: true
  validates :category_id, :status_id, :deli_fee_id, :area_id, :deli_day_id, numericality: { other_than: 1 }
end
