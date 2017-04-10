class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :quality
      t.string :description
      t.string :image_url
      t.integer :price
      t.string :serial_number
      t.date :purchased_on
      t.string :name
      t.boolean :sentimental
      t.boolean :sold

      t.timestamps
    end
  end
end
