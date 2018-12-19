class Item < ApplicationRecord
  # アソシエーションの定義
  belongs_to :lcategory
  belongs_to :mcategory
  belongs_to :scategory
  belongs_to :saler, class_name: "User"

  #buyerなどのアソシエーションは一旦削除してます
  has_one :shipping_method
  accepts_nested_attributes_for :shipping_method
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence:true, length: { maximum: 40 }
  validates :images, presence:true
  validates :detail, presence:true, length: { maximum: 1000 }
  validates :condition, presence:true

end
