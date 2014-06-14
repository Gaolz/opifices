class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title,limit: 50,null:false
      t.string :slug_url,limit: 50,null:false
      t.text :context,limit:16777215,null:false
      t.string :reference_url,limit: 255
      t.timestamps
    end
    add_index :blogs,:slug_url,unique: true
  end
end
