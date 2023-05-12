class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_address
      t.integer :method_of_payment
      t.integer :postage
      t.integer :billing_amount
    end
  end
end
