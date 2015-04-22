class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :studio_price
      t.integer :one_bed_price
      t.integer :two_bed_price
      t.string :city
      t.string :state
      t.timestamps null: false
      t.belongs_to :form
    end
  end
end
