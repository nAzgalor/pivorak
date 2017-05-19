class BusUserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :bus

  validates :number_of_seat, uniqueness: { scope: [:user_id, :bus_id],
    message: 'This number nimber of seat is busy' }

end
