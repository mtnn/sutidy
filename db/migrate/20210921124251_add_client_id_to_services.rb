class AddClientIdToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :client_id, :integer
  end
end
