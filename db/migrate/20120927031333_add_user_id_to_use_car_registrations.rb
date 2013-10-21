class AddUserIdToUseCarRegistrations < ActiveRecord::Migration
  def change
    add_column :use_car_registrations, :user_id, :integer
  end
end
