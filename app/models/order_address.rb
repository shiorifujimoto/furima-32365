class OrderAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :postal_code, :prefecture_id, :city, :block, :build, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city,          format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :block
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block,
                   build: build, order_id: order.id)
  end
end
