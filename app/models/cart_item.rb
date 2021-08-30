class CartItem < ApplicationRecord
  belongs_to :menu
  belongs_to :cart
  attribute :quantity, :integer, default: 0
end
