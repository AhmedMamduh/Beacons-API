class CreateBeacons < ActiveRecord::Migration[5.1]
  def change
    create_table :beacons do |t|
      t.string :name
      t.integer :major
      t.integer :minor
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
