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
  end
end
