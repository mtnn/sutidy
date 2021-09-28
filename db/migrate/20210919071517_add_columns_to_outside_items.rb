class AddColumnsToOutsideItems < ActiveRecord::Migration[5.2]
  def change
    add_column :outside_items, :user_id, :integer
    add_column :outside_items, :outside_name, :string
    add_column :outside_items, :outside_price, :integer
  end
end
