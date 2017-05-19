class BusesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_bus, only: [:show, :buy_ticket]

  def index
    buses = SearchService.new(params)
    @start_places = Bus.start_place_list
    @buses = buses.results
  end

  def show
    all_number_of_seats_in_bus = (1..@bus.number_of_seats).to_a
    busy_place = @bus.bus_user_tickets.pluck(:number_of_seat)
    @available_seats = all_number_of_seats_in_bus - busy_place
  end

  def buy_ticket
    @bus.bus_user_tickets.new(number_of_seat: params[:number_of_seat], user_id: current_user.id)
    if @bus.save
      redirect_to @bus
    end
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params.merge(start_at: bus_params[:start_at].to_datetime, end_at: bus_params[:end_at].to_datetime));
    if @bus.save
      redirect_to root_path, notice: 'Bus rice was created'
    else
     render :new
    end
  end

  private

  def bus_params
    params.require(:bus).permit(:start_at, :end_at, :number_of_seats, :start_place, :end_place)
  end

  def set_bus
    @bus = Bus.find(params[:id])
  end
end
