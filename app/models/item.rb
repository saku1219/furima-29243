class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :shipping_payer, :shipping_from_area, :shipping_duration


  belongs_to :user has_one :order
end
