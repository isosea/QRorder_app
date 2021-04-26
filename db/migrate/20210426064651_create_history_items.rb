class CreateHistoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :history_items do |t|
      t.integer :quantity
      t.references :menu, null: false, foreign_key: true
      t.references :history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
