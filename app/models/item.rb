class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_cost
  belongs_to :prefecture
  belongs_to :shopping_day

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/ }, inclusion: { in: (300..9_999_999) }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shopping_cost_id
      validates :prefecture_id
      validates :shopping_day_id
    end
  end
end
