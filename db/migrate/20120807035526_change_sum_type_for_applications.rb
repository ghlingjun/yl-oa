class ChangeSumTypeForApplications < ActiveRecord::Migration
  change_table :applications do |t|
    t.change :sum, :decimal, :precision=>8, :scale=>2
  end
end
