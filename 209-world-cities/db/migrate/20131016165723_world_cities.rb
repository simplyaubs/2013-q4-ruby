class WorldCities < ActiveRecord::Migration
  def change
 		create_table :world_cities do |t|
 			t.string :city_name
 			t.string :country_flag_filename
 			t.string :time_zone
 			t.string :population
		end
	end 
end
