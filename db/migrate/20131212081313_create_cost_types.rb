class CreateCostTypes < ActiveRecord::Migration
  def change
    create_table :cost_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
