class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :order_ids
      t.integer :price
      t.integer :quantity
    end
  end
end
