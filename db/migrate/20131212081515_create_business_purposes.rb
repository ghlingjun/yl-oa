class CreateBusinessPurposes < ActiveRecord::Migration
  def change
    create_table :business_purposes do |t|
      t.string :name

      t.timestamps
    end
  end
end
