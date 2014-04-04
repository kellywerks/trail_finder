class AddLocationColumns < ActiveRecord::Migration
  def change
    remove_column :locations, :name
    add_column :locations, :city, :string
    add_column :locations, :state, :string
  end
end
