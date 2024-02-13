class CreateExpends < ActiveRecord::Migration[7.1]
  def change
    create_table :expends do |t|
      t.string :name
      t.float :amount
      t.integer :author_id

      t.timestamps
    end

    add_foreign_key :expends, :users, column: :author_id
    add_index :expends, :author_id, unique: false, name: 'index_my_name_shorter'
  end
end
