class AddIndexToBusUserTickets < ActiveRecord::Migration[5.0]
  def change
    add_index :bus_user_tickets, [:user_id, :bus_id, :number_of_seat], unique: true
  end
end
