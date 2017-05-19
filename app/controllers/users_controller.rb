class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @tickets = user.bus_user_tickets.map do |t| 
      { start_place: t.bus.start_place,
        start_at: t.bus.start_at,
        end_place: t.bus.end_place,
        end_at: t.bus.end_at,
        number_of_seat: t.number_of_seat,
        buy_time: t.created_at
      }
    end
  end
end
