class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.integer :duration
      t.text :description
      t.string :location
      t.integer :price

      t.references :admin, index: true

      t.timestamps
    end
  end
end
