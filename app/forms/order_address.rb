class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal, :prefect_id, :city, :address, :building, :tel, :price, :order_id

  with_options presence: true do
    validates :postal,     format: { with: /\A\d{3}[-]\d{4}\z/, message: 'code input correctly' }
    validates :prefect_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :tel,        format: { with: /\d/, message: 'Half-width number' },
                           length: { maximum: 11, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(item_id: item_id, postal: postal, prefect_id: prefect_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
  
end
