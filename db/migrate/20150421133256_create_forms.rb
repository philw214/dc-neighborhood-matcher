class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user
      t.references :neighborhood
      t.integer :income
      t.decimal :healthcare
      t.decimal :savings
      t.decimal :eating_out
      t.decimal :groceries
      t.decimal :cabs
      t.decimal :public_transportation
      t.decimal :driving
      t.decimal :travel
      t.decimal :gym
      t.decimal :recreation
      t.decimal :shopping
      t.timestamps null: false
    end
  end
end
