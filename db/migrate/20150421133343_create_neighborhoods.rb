class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      # t.string :name
      # t.decimal :studio_price
      # t.decimal :one_bed_price
      # t.decimal :two_bed_price
      t.string :name
      t.string :city
      t.string :state
      t.string :metro
      t.string :county_name
      t.timestamps null: false
      t.belongs_to :form
    end
  end
end
