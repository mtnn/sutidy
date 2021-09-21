class CreateOutsideItems < ActiveRecord::Migration[5.2]
  def change
    create_table :outside_items do |t|

      t.timestamps
    end
  end
end
