class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :shipping_fee
  belongs_to :status

  with_options presence: true do
    validates :prodcut_name
    validates :product_description
    validates :image
  end

  # validates_format_of :image, with: IMAGE_REGEX, message: "can't be blank"
  # validates :prodcut_name, presence: true

  validates :category_id, numericality:  { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
