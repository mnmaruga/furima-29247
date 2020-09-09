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

  with_options presence: true do
    validates :image
    validates :item
    validates :detail
    validates :category
    validates :status
    validates :deli_fee
    validates :area
    validates :deli_day
  end
  validates :price, presence: true
  validates :price, format: { with: /\d/ }
  validates :price, inclusion: { in: 300..9999999 }
  validates :category_id, :status_id, :deli_fee_id, :area_id, :deli_day_id, numericality: { other_than: 1 }

end
