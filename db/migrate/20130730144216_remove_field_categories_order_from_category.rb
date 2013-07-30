class RemoveFieldCategoriesOrderFromCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :categories_order
  end

  def down
    add_column :categories, :categories_order, :string
  end
end
