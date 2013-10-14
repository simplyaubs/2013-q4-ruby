class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.integer :number
    	t.string  :name
    	t.integer :systolic
    	t.integer :diastolic
    end
  end
end
