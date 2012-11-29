# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::Country do

  describe "GET isPublicHoliday" do
    before(:each) do
      VCR.insert_cassette 'is_public_holiday', :record => :new_episodes
    end
    after(:each) do
      VCR.eject_cassette
    end

    let(:country) { Enrico::Country.new("ger") }

    it "should trueify that date is public holiday" do
      date = Date.today.beginning_of_year
      country.is_public_holiday?(date).must_equal true
    end

    it "should falsify that date is public holiday" do
      date = Date.today.beginning_of_year + 28.days
      country.is_public_holiday?(date).must_equal false
    end

  end

end

