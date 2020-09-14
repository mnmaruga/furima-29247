class Order < ApplicationRecord
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'code input correctly' }
    validates :prefect
    validates :city
    validates :address
    validates :tel,    format: { with: /\d/, message: 'Half-width number' }
  end
  validates :prefect_id, numericality: { other_than: 1, message: 'Select' }
end
