class AddCreatedByToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :created_by_id, :integer
  end
end
