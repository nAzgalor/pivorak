class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :number_of_seats
      t.string :start_place
      t.string :end_place

      t.timestamps
    end
  end
end
