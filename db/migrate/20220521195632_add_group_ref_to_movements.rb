class AddGroupRefToMovements < ActiveRecord::Migration[7.0]
  def change
    add_reference :movements, :group, null: false, foreign_key: true
  end
end
