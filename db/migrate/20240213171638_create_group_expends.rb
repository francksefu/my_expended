class CreateGroupExpends < ActiveRecord::Migration[7.1]
  def change
    create_table :group_expends do |t|
      t.references :group, foreign_key: true
      t.references :expend, foreign_key: true

      t.timestamps
    end
  end
end
