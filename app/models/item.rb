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
    validates :price
  end
  validates :price, format: { with: /\d/, message: 'Half-width number' }
  validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :deli_fee_id, numericality: { other_than: 1, message: 'Select' }
  validates :area_id, numericality: { other_than: 1, message: 'Select' }
  validates :deli_day_id, numericality: { other_than: 1, message: 'Select' }
end
