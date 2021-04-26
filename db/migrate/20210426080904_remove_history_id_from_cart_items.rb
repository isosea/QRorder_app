class RemoveHistoryIdFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_items, :history_id, :integer
  end
end
