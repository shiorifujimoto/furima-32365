class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :phone_number,  numericality: { with: /\A\d{10}\z/ }
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :build
  end
end
