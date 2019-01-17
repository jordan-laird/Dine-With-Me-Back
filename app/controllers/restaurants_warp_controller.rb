
class RestaurantsWarpController < ApplicationController
  def index(params)
    response = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=29.759236,-95.3633486&key=#{Figaro.env.googleKey}&radius=16093.4&type=restaurant&keyword="))
    yield json: response
  end
end