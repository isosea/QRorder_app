class AddExistenceToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :existence, :boolean
  end
end
