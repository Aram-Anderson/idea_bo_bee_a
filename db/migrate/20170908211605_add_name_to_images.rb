class AddNameToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :name, :text
  end
end
