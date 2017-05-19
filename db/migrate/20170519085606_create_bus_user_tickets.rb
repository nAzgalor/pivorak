class CreateBusUserTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_user_tickets do |t|
      t.references :user, foreign_key: true
      t.references :bus, foreign_key: true
      t.integer :number_of_seat

      t.timestamps
    end
  end
end
