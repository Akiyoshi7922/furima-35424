class OrderPayjp
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address, :city, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :city
  validates :address
  validates :prefecture_id
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :token
  validates :user_id
  validates :item_id
  end

  with_options numericality:  { other_than: 1 } do
   validates :prefecture_id
  end

  def save

  order = Order.create(user_id: user_id,  item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, address: address, city: city, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end