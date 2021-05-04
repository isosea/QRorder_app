class AddCategoryToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :category, :string
  end
end
