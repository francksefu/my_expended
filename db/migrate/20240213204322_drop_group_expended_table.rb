class DropGroupExpendedTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :group_expends
    add_reference :expends, :group, foreign_key: true
  end
end
