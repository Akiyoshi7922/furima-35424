class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :image
    validates :price
  end
  with_options numericality:  { other_than: 1 } do
  validates :category_id
  validates :product_status_id
  validates :shipping_id
  validates :prefecture_id
  validates :shipping_day_id
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
