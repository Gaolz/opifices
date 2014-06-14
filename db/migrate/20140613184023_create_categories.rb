class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 20
      t.string :desc, limit: 50
      t.timestamps
    end
    add_column :blogs,:category_id,:integer
  end
end
