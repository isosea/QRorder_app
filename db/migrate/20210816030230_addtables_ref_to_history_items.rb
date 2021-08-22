class AddtablesRefToHistoryItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :history_items, :tables, index: true
  end
end
