class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category

  validates :image,            presence: true
  validates :title,            presence: true
  validates :description,      presence: true
  validates :price,    presence: true, format: { with: /[300-9999999\d]{3,7}/ }
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :status_id,        presence: true, numericality: { other_than: 1 }
  validates :shopping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :shopping_day_id,  presence: true, numericality: { other_than: 1 }
end
