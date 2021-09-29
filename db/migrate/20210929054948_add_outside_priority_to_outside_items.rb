class AddOutsidePriorityToOutsideItems < ActiveRecord::Migration[5.2]
  def change
    add_column :outside_items, :outside_priority, :integer, default: 0
  end
end
