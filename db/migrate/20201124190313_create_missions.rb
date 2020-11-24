class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :association
      t.datetime :start_time
      t.datetime :end_time
      t.integer :quota
      t.boolean :done
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
