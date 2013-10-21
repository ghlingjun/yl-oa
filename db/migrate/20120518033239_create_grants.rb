class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :right_id
      t.integer :role_id

      t.timestamps
    end
    add_index :grants, :right_id
    add_index :grants, :role_id
  end

  def self.down
    drop_table :grants
  end
end
