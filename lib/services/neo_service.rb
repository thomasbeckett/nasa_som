require 'httparty'
require 'json'

class NeoService
  include HTTParty
  base_uri 'https://api.nasa.gov/neo/rest/v1/feed?'

  attr_accessor :neo

  def initialize start_date, end_date
    @api_key = "6982JbtUDAuS4ZJ1JdsHZAQ767pXiDRVM3ajjCks"
    @neo = JSON.parse(self.class.get("start_date=#{start_date}&end_date=#{end_date}&api_key=#{@api_key}").body)
  end
end
