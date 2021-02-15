class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_cost
  belongs_to :prefecture
  belongs_to :shopping_day

  validates :image,            presence: true
  validates :title,            presence: true
  validates :description,      presence: true
  validates :price,            presence: true, numericality: {with: /\A[0-9]+\z/ }, inclusion: {in: (300..9999999)}
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :status_id,        presence: true, numericality: { other_than: 1 }
  validates :shopping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates :shopping_day_id,  presence: true, numericality: { other_than: 1 }
end
