class CartItem < ApplicationRecord
  belongs_to :menu
  belongs_to :cart
end
