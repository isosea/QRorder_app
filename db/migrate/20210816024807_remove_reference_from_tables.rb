class RemoveReferenceFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tables, :history_items
    remove_reference :tables, :history_item
  end
end
