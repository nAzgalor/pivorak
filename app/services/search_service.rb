class SearchService
  def initialize(params)
    @start_place = params[:start_place]
    @start_at = params[:start_at].to_date if params[:start_at].present?
  end

  def results
    buses = Bus.all
    buses = buses.where(start_place: @start_place) if @start_place.present?
    buses = buses.where(start_at: @start_at.beginning_of_day..@start_at.end_of_day) if @start_at.present?
    buses
  end
end