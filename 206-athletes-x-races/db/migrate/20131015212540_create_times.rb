class CreateTimes < ActiveRecord::Migration
  def change
    create_table :races do |t|
    	t.string :name
    end

    create_table :runners do |t|
    	t.string :name
    end
  end
end
