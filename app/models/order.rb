class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  validates :method_of_payment, presence: true
  validates :shipping_postal_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

  enum method_of_payment: { credit_card: 0, transfer: 1}
end
