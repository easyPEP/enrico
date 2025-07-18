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
      _(Enrico::Country).must_include HTTParty
    end
    it "must have the base url set to the Dribble API endpoint" do
      _(Enrico::Country.base_uri).must_equal 'https://kayaposoft.com/enrico/json/v2.0'
    end
  end

  describe "GET SupportedCountries" do

    it "records the fixture" do
      Enrico::Country.get('/?action=getSupportedCountries')
    end

    describe "get list of all supported countries" do

      it "must have all method" do
        _(Enrico::Country).must_respond_to :all
      end

      it "must parse the api response from JSON to Hash" do
        _(Enrico::Country.all).must_be_instance_of HTTParty::Response
        _(Enrico::Country.all.to_a).must_be_instance_of Array
      end

    end

    describe "default instance attributes" do
      let(:country) { Enrico::Country.new("deu") }

      it "must have an country_code attribute" do
        _(country).must_respond_to :country_code
      end

      it "must have the right id" do
        _(country.country_code).must_equal 'deu'
      end

    end

    describe "get list of all supported countries" do

      let(:country) { Enrico::Country.new("deu") }

      it "must have a country method" do
        _(country).must_respond_to :details
      end

      it "must repond with the details of a country" do
        _(country.full_name).must_equal 'Germany'
      end

      it "should respond with the fromDate" do
        format = {"day"=>1, "month"=>1, "year"=>2011}
        _(country.from_date).must_equal format
      end

      it "should respond with toDate" do
        toDate = {"day"=>31, "month"=>12, "year"=>32767}
        _(country.toDate).must_equal toDate
      end

      it "should respond with regions" do
        regions = ["bw", "by", "be", "bb", "hb", "hh", "he", "ni", "mv", "nw", "rp", "sl", "sn", "st", "sh", "th"]
        _(country.regions).must_be_instance_of Array
        _(country.regions).must_equal regions
      end

    end

  end

  describe "method_missing" do
    let(:country) { Enrico::Country.new("deu") }
    
    before do
      # Mock the details method to return a hash with test data
      def country.details
        {
          "fullName" => "Germany",
          "countryCode" => "deu",
          "fromDate" => {"day"=>1, "month"=>1, "year"=>2011},
          "toDate" => {"day"=>31, "month"=>12, "year"=>32767}
        }
      end
    end

    it "converts snake_case method names to camelCase for accessing details" do
      _(country.full_name).must_equal "Germany"
      _(country.country_code).must_equal "deu"
    end

    it "handles already camelCase properties" do
      _(country.fromDate).must_equal({"day"=>1, "month"=>1, "year"=>2011})
      _(country.toDate).must_equal({"day"=>31, "month"=>12, "year"=>32767})
    end

    it "raises NoMethodError for non-existent properties" do
      assert_raises(NoMethodError) do
        country.non_existent_property
      end
    end
  end

  describe "country_parameters" do
    let(:country) { Enrico::Country.new("deu", "by") }
    let(:country_no_region) { Enrico::Country.new("deu") }

    it "includes country code and region in parameters" do
      params = country.country_parameters({month: 1, year: 2024})
      _(params).must_include "country=deu"
      _(params).must_include "region=by"
      _(params).must_include "month=1"
      _(params).must_include "year=2024"
    end

    it "excludes nil region from parameters" do
      params = country_no_region.country_parameters({month: 1, year: 2024})
      _(params).must_include "country=deu"
      _(params).wont_include "region="
    end

    it "includes holiday_type when provided and not empty" do
      params = country.country_parameters({month: 1}, holiday_type: "public_holiday")
      _(params).must_include "holidayType=public_holiday"
    end

    it "excludes holiday_type when nil" do
      params = country.country_parameters({month: 1}, holiday_type: nil)
      _(params).wont_include "holidayType"
    end

    it "excludes holiday_type when empty string" do
      params = country.country_parameters({month: 1}, holiday_type: "")
      _(params).wont_include "holidayType"
    end

    it "properly encodes parameters for URL" do
      params = country.country_parameters({date: "01-01-2024"})
      _(params).must_equal "country=deu&region=by&date=01-01-2024"
    end
  end

end
