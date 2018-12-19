class ChengeDatefileBurdenFeeOfShippingMethods < ActiveRecord::Migration[5.2]
  def up
    change_column :shipping_methods, :burden_fee, :string, null:false
  end
end
