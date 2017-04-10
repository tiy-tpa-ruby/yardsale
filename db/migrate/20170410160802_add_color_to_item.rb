class AddColorToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :color, :string
  end
end
