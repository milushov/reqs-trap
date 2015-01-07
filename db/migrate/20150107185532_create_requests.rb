class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :body
      t.references :trap, index: true

      t.timestamps null: false
    end
    add_foreign_key :requests, :traps
  end
end
