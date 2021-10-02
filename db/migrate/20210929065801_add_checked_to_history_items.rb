class AddCheckedToHistoryItems < ActiveRecord::Migration[6.0]
  def change
    add_column :history_items, :checked, :boolean
  end
end
