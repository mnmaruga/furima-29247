class Address < ApplicationRecord
  belongs_to :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefect

  attr_accessor :token
  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'code input correctly' }
    validates :prefect
    validates :city
    validates :address
    validates :tel,    format: { with: /\d/, message: 'Half-width number' }
    validates :price
    validates :token
  end
  validates :prefect_id, numericality: { other_than: 1, message: 'Select' }
end
