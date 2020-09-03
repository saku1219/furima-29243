class Item < ApplicationRecord

  belongs_to :user 

  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_payer_id
    validates :shipping_from_area_id
    validates :shipping_duration_id
  end
end
