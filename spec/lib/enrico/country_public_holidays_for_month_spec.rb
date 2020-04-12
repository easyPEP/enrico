# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::Country do

  describe "GET getHolidaysForMonth" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_month', :record => :new_episodes
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in month" do
      date                      = Date.today.beginning_of_year
      dates                     = country.holidays_for_month(date)
      dates.first.date          = Date.today.beginning_of_year
      dates.first.local_name    = "Neujahrstag"
      dates.first.english_name  = "New Year's Day"
    end
  end

  describe "GET getHolidaysForYear" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_year', :record => :new_episodes
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in month" do
      date                      = Date.today.beginning_of_year
      dates                     = country.holidays_for_year(date)
      dates.first.date          = Date.today.beginning_of_year
      dates.first.local_name    = "Neujahrstag"
      dates.first.english_name  = "New Year's Day"
    end
  end

  describe "GET getForDateRange" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_date_range', :record => :new_episodes
    end

    after(:each) do
      VCR.eject_cassette
    end
    let(:country) { Enrico::Country.new("deu") }
    it "should return all holidays in date range" do
      start_date = Date.today.beginning_of_year
      end_date = Date.today.beginning_of_year + 2.month

      dates = country.holidays_for_date_range(start_date, end_date)

      dates.first.date          = Date.today.beginning_of_year
      dates.first.local_name    = "Neujahrstag"
      dates.first.english_name  = "New Year's Day"
    end
  end

end
