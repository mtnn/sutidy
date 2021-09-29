class AddSubscribedPriorityToSubscribedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_items, :subscribed_priority, :integer, default: 0
  end
end
