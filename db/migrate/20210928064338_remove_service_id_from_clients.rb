class RemoveServiceIdFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :service_id, :integer
  end
end
