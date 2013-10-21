class CreateUseCarRegistrations < ActiveRecord::Migration
  def change
    create_table :use_car_registrations do |t|
      t.string :real_user_name
      t.date :start_at_date
      t.date :end_at_date
      t.text :reason
      t.integer :start_km_num
      t.integer :end_km_num

      t.timestamps
    end
  end
end
