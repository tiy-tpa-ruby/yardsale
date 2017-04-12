class AddImageDataToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :image_data, :text
  end
end
