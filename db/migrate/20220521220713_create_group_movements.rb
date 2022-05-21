class CreateGroupMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :group_movements do |t|
      t.references :group
      t.references :movement
      t.timestamps
    end
  end
end
