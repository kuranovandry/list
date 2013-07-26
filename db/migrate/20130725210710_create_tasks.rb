class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :category_id
      t.string :film_name
      t.integer :film_duration

      t.timestamps
    end
  end
end
