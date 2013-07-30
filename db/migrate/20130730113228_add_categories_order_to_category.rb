class AddCategoriesOrderToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :categories_order, :string
  end
end
