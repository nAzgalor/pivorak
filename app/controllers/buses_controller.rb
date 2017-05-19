class BusesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def index
    buses = SearchService.new(params)
    @start_places = Bus.start_place_list
    @buses = buses.results
  end

  def show
    @bus = Bus.find(params[:id])
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
end
