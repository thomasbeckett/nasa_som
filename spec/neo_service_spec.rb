require_relative '../lib/nasa.rb'

describe 'Nasa NEO' do
  before(:all) do
    @neo = Nasa.new.neo_service "2018-10-18", "2018-10-19"
  end

  context "links" do
    it "should get links" do
      expect(@neo.neo).to have_key("links")
    end

    it "should get links as a hash" do
      expect(@neo.neo["links"]).to be_a Hash
    end

    it "should get links keys" do
      expect(@neo.neo["links"].keys).to eq ["next","prev","self"]
    end

    it "should get links next to be a string" do
      expect(@neo.neo["links"]["next"]).to be_a String
    end

    it "should get links prev to be a string" do
      expect(@neo.neo["links"]["prev"]).to be_a String
    end

    it "should get links self to be a string" do
      expect(@neo.neo["links"]["self"]).to be_a String
    end
  end

  context "near earth objects" do
    it "should get element count as an integer " do
      expect(@neo.neo["element_count"]).to be_an Integer
    end

    it "should get near earth objects as a hash" do
      expect(@neo.neo["near_earth_objects"]).to be_an Hash
    end

    it "should have two keys (for days 2018-10-18 and 2018-10-19)" do
      expect(@neo.neo["near_earth_objects"].keys.length).to be >= 1
    end

    it "should have keys as arrays" do
      expect(@neo.get_neo_keys).to eq true
    end

    it "should return each neo on a date as a hash" do
      expect(@neo.get_each_neo)
    end

    it "should get each neo with links key as a hash" do
      expect(@neo.get_each_neo_key "links", Hash).to eq true
    end

    it "should get each neo with id key as a string" do
      expect(@neo.get_each_neo_key "id", String).to eq true
    end

    it "should get each neo with neo_reference_id key as a string" do
      expect(@neo.get_each_neo_key "neo_reference_id", String).to eq true
    end

    it "should get each neo with name key as a String" do
      expect(@neo.get_each_neo_key "name", String).to eq true
    end

    it "should get each neo with nasa_jpl_url key as a string" do
      expect(@neo.get_each_neo_key "nasa_jpl_url", String).to eq true
    end

    it "should get each neo with absolute_magnitude_h key as a number" do
      expect(@neo.get_each_neo_key "absolute_magnitude_h", Numeric).to eq true
    end

    it "should get each neo with estimated_diameter key as a hash" do
      expect(@neo.get_each_neo_key "estimated_diameter", Hash).to eq true
    end

    it "should get each neo with is_potentially_hazardous_asteroid key as a boolean" do
      expect(@neo.neo_key_bool "is_potentially_hazardous_asteroid").to eq true
    end

    it "should get each neo with close_approach_data key as a array" do
      expect(@neo.get_each_neo_key "close_approach_data", Array).to eq true
    end

    it "should get each neo with is_sentry_object key as a boolean" do
      expect(@neo.neo_key_bool "is_sentry_object").to eq true
    end


  end

  context "estimated_diameter" do
    it "should have km, meters, miles, and feet " do
      expect(@neo.get_estimated_diameter_keys).to be true
    end

    it "should have min diamter less than max diameter" do
      expect(@neo.min_max_diameter).to eq true
    end
  end

  context "close approach data" do
    it "should have a close approach date to be a string" do
      expect(@neo.close_approach "close_approach_date", String).to eq true
    end

    it "should have a epoch_date_close_approach to be a Integer" do
      expect(@neo.close_approach "epoch_date_close_approach", Integer).to eq true
    end

    it "should have a relative_velocity to be a Hash" do
      expect(@neo.close_approach "relative_velocity", Hash).to eq true
    end

    it "should have a miss_distance to be a Hash" do
      expect(@neo.close_approach "miss_distance", Hash).to eq true
    end

    it "should have a orbiting_body to be a String" do
      expect(@neo.close_approach "orbiting_body", String).to eq true
    end

    it "should have relative velocity in kilometers_per_second, kilometers_per_hour, and miles_per_hour " do
      expect(@neo.close_approach_units "relative_velocity", ["kilometers_per_second", "kilometers_per_hour", "miles_per_hour"]).to eq true
    end

    it "should have miss_distance in astronomical, lunar, kilometers and miles " do
      expect(@neo.close_approach_units "miss_distance", ["astronomical","lunar", "kilometers", "miles"]).to eq true
    end

  end
end
