class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :location_id, :integer

      t.timestamps
    end

    create_table :locations do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
