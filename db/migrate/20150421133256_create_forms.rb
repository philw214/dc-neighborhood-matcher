class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user
      t.references :neighborhood
      t.integer :income
      t.string :bedrooms
      t.string :healthcare
      t.integer :savings
      t.integer :dining_out_low
      t.integer :dining_out_medium
      t.integer :dining_out_high
      t.integer :driving_trips
      t.integer :car_trip_duration
      t.integer :mass_transit_trips
      t.integer :groceries
      t.integer :cabs
      t.integer :recreation
      t.integer :shopping
      t.integer :random_path
      t.timestamps null: false
    end
  end
end
