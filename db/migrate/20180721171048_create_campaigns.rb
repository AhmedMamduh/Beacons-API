class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :enabled
      t.references :beacon, foreign_key: true

      t.timestamps
    end
  end
end
