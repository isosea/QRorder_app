class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default:0
      t.references :menu, :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
