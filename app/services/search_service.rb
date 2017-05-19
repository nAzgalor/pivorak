class SearchService
  def initialize(params)
    @start_place = params[:start_place]
    @start_at = params[:start_at]
  end

  def results
    buses = Bus.all
    buses = buses.where(start_place: @start_place) if @start_place.present?
    buses = buses.where(start_at: @start_at) if @start_at.present?
    buses
  end
end