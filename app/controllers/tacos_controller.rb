class TacosController < ApplicationController
  def search
  end

  def results

    foursquare_client = Foursquare2::Client.new(:api_version => '20120609',
    :client_id => ENV["FOURSQUARE_CLIENT_ID"],
    :client_secret => ENV["FOURSQUARE_CLIENT_SECRET"])

    # latlng =
    if params[:location].present?
      results = Geocoder.search(params[:location])
      @lat = results.first.data["lat"].to_f.round(2)
      @lng = results.first.data["lon"].to_f.round(2)
    else
      Rails.logger.info request.location.inspect
      @lat = request.location.data["latitude"].to_f.round(2)
      @lng = request.location.data["longitude"].to_f.round(2)
    end
    latlng = [@lat,@lng].join(",")
    result = foursquare_client.search_venues(:ll => latlng, :query => 'tacos')
    @venues = result["venues"]
  end
end
