class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :shipping_fee
  belongs_to :status

  validates :name, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
