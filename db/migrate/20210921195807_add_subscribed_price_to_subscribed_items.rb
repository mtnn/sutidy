class AddSubscribedPriceToSubscribedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_items, :subscribed_price, :integer
  end
end
