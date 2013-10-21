class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :content
      t.integer :sender
      t.string :type
      t.string :state
      t.integer :sum

      t.timestamps
    end
  end
end
