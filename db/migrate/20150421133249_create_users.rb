class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :form
      t.timestamps null: false
    end
  end
end
