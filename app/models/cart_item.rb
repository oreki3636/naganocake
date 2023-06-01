class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item


   def subtotal
    (self.item.taxprice).floor*amount
   end

end
