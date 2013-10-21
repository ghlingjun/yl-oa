class RemoveSumFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :sum
  end

  def down
    add_column :messages, :sum, :integer
  end
end
