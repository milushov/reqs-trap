class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :secure_id

      t.timestamps null: false
    end

    add_index :traps, :secure_id, unique: true
  end
end
