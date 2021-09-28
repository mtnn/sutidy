class AddSubscribeStatusToSubscribedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_items, :subscribe_status, :integer, default: 0
  end
end
