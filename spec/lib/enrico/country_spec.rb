# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::Country do

  before(:each) do
    VCR.insert_cassette 'supported_countries', :record => :new_episodes
  end

  after(:each) do
    VCR.eject_cassette
  end

  describe "default attributes" do
    it "must include httparty methods" do
      Enrico::Country.must_include HTTParty
    end
    it "must have the base url set to the Dribble API endpoint" do
      Enrico::Country.base_uri.must_equal 'https://kayaposoft.com/enrico/json/v2.0'
    end
  end

  describe "GET SupportedCountries" do

    it "records the fixture" do
      Enrico::Country.get('/?action=getSupportedCountries')
    end

    describe "get list of all supported countries" do

      it "must have all method" do
        Enrico::Country.must_respond_to :all
      end

      it "must parse the api response from JSON to Hash" do
        Enrico::Country.all.must_be_instance_of HTTParty::Response
        Enrico::Country.all.to_a.must_be_instance_of Array
      end

    end

    describe "default instance attributes" do
      let(:country) { Enrico::Country.new("deu") }

      it "must have an country_code attribute" do
        country.must_respond_to :country_code
      end

      it "must have the right id" do
        country.country_code.must_equal 'deu'
      end

    end

    describe "get list of all supported countries" do

      let(:country) { Enrico::Country.new("deu") }

      it "must have a country method" do
        country.must_respond_to :details
      end

      it "must repond with the details of a country" do
        country.full_name.must_equal 'Germany'
      end

      it "should respond with the fromDate" do
        format = {"day"=>1, "month"=>1, "year"=>2011}
        country.from_date.must_equal format
      end

      it "should respond with toDate" do
        toDate = {"day"=>31, "month"=>12, "year"=>32767}
        country.toDate.must_equal toDate
      end

      it "should respond with regions" do
        regions = ["bw", "by", "be", "bb", "hb", "hh", "he", "ni", "mv", "nw", "rp", "sl", "sn", "st", "sh", "th"]
        country.regions.must_be_instance_of Array
        country.regions.must_equal regions
      end

    end

  end

end
