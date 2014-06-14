class ImageSupport < ActiveRecord::Migration
  def change
    add_column :blogs,:thumb,:string
  end
end
