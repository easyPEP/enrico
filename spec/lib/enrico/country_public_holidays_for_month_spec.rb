# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::Country do

  describe "GET getHolidaysForMonth" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_month'
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in month" do
      dates = country.holidays_for_month(Date.parse('2020-01-15'))

      _(dates.first.date).must_equal Date.parse('2020-01-01')
      _(dates.first.local_name).must_equal "Neujahrstag"
      _(dates.first.english_name).must_equal "New Year's Day"
    end
  end

  describe "GET getHolidaysForYear" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_year'
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in year" do
      dates = country.holidays_for_year(Date.parse('2020-06-01'))

      _(dates.first.date).must_equal Date.parse('2020-01-01')
      _(dates.first.local_name).must_equal "Neujahrstag"
      _(dates.first.english_name).must_equal "New Year's Day"

      _(dates.last.date).must_equal Date.parse('2020-12-26')
      _(dates.last.local_name).must_equal "Zweiter Weihnachtsfeiertag"
      _(dates.last.english_name).must_equal "Boxing Day"
    end
  end

  describe "GET getForDateRange" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_date_range'
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in date range" do
      dates = country.holidays_for_date_range(Date.parse('2020-01-01'), Date.parse('2020-03-31'))

      _(dates.first.date).must_equal Date.parse('2020-01-01')
      _(dates.first.local_name).must_equal "Neujahrstag"
      _(dates.first.english_name).must_equal "New Year's Day"

      _(dates.last.date).must_equal Date.parse('2020-03-29')
      _(dates.last.local_name).must_equal "Beginn der Sommerzeit"
      _(dates.last.english_name).must_equal "Daylight Saving Time Starts"
    end
  end

end
