class RestaurantsWarpController < ApplicationController
  def index(params)
    response = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=29.759236,-95.3633486&key=AIzaSyDbgCD5xqCrFD1hLovVCrEN0NOSd8Vk_b0&radius=16093.4&type=restaurant&keyword="))
    yield response
  end
end