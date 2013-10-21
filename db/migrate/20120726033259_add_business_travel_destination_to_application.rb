class AddBusinessTravelDestinationToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :business_travel_destination, :string
  end
end
