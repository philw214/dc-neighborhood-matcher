class AddSlugToForms < ActiveRecord::Migration
  def change
    add_column :forms, :slug, :string
    add_index :forms, :slug
  end
end
