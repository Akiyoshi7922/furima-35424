class Item < ApplicationRecord
  has_one_attached :image

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

  # validates_format_of :image, with: IMAGE_REGEX, message: "can't be blank"
  # validates :prodcut_name, presence: true

  validates :category_id, numericality:  { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
