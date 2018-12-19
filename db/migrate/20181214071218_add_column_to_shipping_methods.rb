class AddColumnToShippingMethods < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_methods, :shipping_methods, :string, null:false
  end
end
