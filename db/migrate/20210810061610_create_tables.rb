class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.references :history_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
