class AddColumnToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :user_id, :integer
    add_column :services, :genre_id, :integer
    add_column :services, :name, :string
    add_column :services, :description, :text
    add_column :services, :price, :integer
    add_column :services, :is_stopped, :integer
  end
end
