class CreateSubscribedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribed_items do |t|

      t.timestamps
    end
  end
end
