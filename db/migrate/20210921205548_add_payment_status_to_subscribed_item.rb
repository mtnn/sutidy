class AddPaymentStatusToSubscribedItem < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_items, :payment_status, :integer, default: 0
  end
end
