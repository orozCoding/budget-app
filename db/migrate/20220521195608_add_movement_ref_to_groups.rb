class AddMovementRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :movement, null: false, foreign_key: true
  end
end
