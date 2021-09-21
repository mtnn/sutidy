class AddColumnsToSubscribedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_items, :user_id, :integer
    add_column :subscribed_items, :service_id, :integer
    add_column :subscribed_items, :payment_status, :integer
  end
end
