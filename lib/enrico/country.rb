# encoding: utf-8

module Enrico
  class Country

    attr_accessor :country_code, :region

    include HTTParty

    base_uri 'http://kayaposoft.com/enrico/json/v1.0'

    def initialize(country_code, region = nil)
      self.country_code = country_code
      self.region = region
    end

    def self.all
      self.get_countries
    end

    def details
      self.class.all.select{|country| country["countryCode"] == self.country_code }.first
    end

    def public_holidays_for_month(date)
      response = self.get_public_holidays_for_month(date)
      self.vacation_days_from_response(response)
    end

    def public_holidays_for_year(date)
      response = self.get_public_holidays_for_year(date)
      self.vacation_days_from_response(response)
    end

    def public_holidays_for_date_range(from_date, to_date)
      response = self.get_public_holidays_for_date_range(from_date, to_date)
      self.vacation_days_from_response(response)
    end

    def is_public_holiday?(date)
      response = self.is_public_holiday(date)
      response["isPublicHoliday"]
    end

    def method_missing(name, *args, &block)
      method_name = name.to_s.camelize(:lower)
      details.has_key?(method_name) ? details[method_name] : super
    end

    def self.get_countries
      JSON.parse(self.get("/?action=getSupportedCountries"))
    end

    def vacation_days_from_response(response)
      vacation_days = []
      response.each do |vacation_day|
        vacation_days.push( Enrico::VacationDay.new(vacation_day) )
      end
      vacation_days      
    end

    def is_public_holiday(date)
      JSON.parse(self.class.get("/?action=isPublicHoliday&date=#{date.strftime("%d-%m-%Y")}&country=#{URI::encode(self.country_code)}&region=#{URI::encode(self.region)}"))
    end

    def get_public_holidays_for_month(date)
      JSON.parse(self.class.get("/?action=getPublicHolidaysForMonth&month=#{date.month}&year=#{date.year}&country=#{URI::encode(self.country_code)}&region=#{URI::encode(self.region)}"))
    end

    def get_public_holidays_for_year(date)
      JSON.parse(self.class.get("/?action=getPublicHolidaysForYear&year=#{date.year}&country=#{URI::encode(self.country_code)}&region=#{URI::encode(self.region)}"))
    end

    def get_public_holidays_for_date_range(from_date, to_date)
      JSON.parse(self.class.get("/?action=getPublicHolidaysForDateRange&fromDate=#{from_date.strftime("%d-%m-%Y")}&toDate=#{to_date.strftime("%d-%m-%Y")}&country=#{URI::encode(self.country_code)}&region=#{URI::encode(self.region)}"))
    end

  end
end



