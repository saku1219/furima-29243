class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tell
  end

  def save(item_id, user_id)
    order = Order.create(user_id: user_id, item_id: item_id.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tell: tell, order_id: order.id)
  end
end