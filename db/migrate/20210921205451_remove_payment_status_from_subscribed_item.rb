class RemovePaymentStatusFromSubscribedItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscribed_items, :payment_status, :integer
  end
end
