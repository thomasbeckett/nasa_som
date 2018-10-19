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

  def get_neo_keys
    @neo["near_earth_objects"].each_key do |key|
      unless key.is_a? Array
        return true
      end
    end
    return false
  end

  def get_each_neo
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        unless object.is_a? Hash
          return false
        end
      end
    end
    return true
  end

  def get_each_neo_key k, v
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        unless object[k].is_a? v
          return false
        end
      end
    end
    return true
  end

  def neo_key_bool k
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        unless [true, false].include? object[k]
          return false
        end
      end
    end
    return true
  end

  def get_estimated_diameter_keys
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        unless object["estimated_diameter"].keys == ["kilometers","meters","miles", "feet"]
          return false
        end
      end
    end
    return true
  end

  def min_max_diameter
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        object["estimated_diameter"].each_key do |k|
          unless object["estimated_diameter"][k]["estimated_diameter_min"] <= object["estimated_diameter"][k]["estimated_diameter_max"]
            return false
          end
        end
      end
    end
    return true
  end

  def close_approach k, v
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        object["close_approach_data"].each do |data|
          unless data[k].is_a? v
            return false
          end
        end
      end
    end
    return true
  end

  def close_approach_units k, units
    @neo["near_earth_objects"].each_key do |key|
      @neo["near_earth_objects"][key].each do |object|
        object["close_approach_data"].each do |data|
          unless data[k].keys == units
            return false
          end
        end
      end
    end
    return true
  end
end
