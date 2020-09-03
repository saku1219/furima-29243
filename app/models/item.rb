class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :price,                 numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
    validates :description
    validates :category_id,           numericality: { other_than: 1, message: " is invalid" }
    validates :condition_id,          numericality: { other_than: 1, message: " is invalid" }
    validates :shipping_payer_id,     numericality: { other_than: 1, message: " is invalid" }
    validates :shipping_from_area_id, numericality: { other_than: 1, message: " is invalid" }
    validates :shipping_duration_id,  numericality: { other_than: 1, message: " is invalid" }
  end
end
