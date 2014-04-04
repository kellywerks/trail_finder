class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    create_table :tags_trails do |t|
      t.integer :tag_id
      t.integer :trail_id
    end
  end
end
