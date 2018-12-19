class ShippingMethod < ApplicationRecord
  # アソシエーションの定義
  belongs_to :item

  validates :burden_fee, presence:true
  validates :shipping_methods, presence:true
  validates :prefecuture, presence:true
  validates :days_to_arrival, presence:true
end
