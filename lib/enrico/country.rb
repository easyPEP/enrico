# encoding: utf-8

module Enrico
  class Country

    attr_accessor :country_code, :region

    include HTTParty

    base_uri 'https://kayaposoft.com/enrico/json/v2.0'

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

    def holidays_for_month(date)
      response = self.get_holidays_for_month(date)
      self.vacation_days_from_response(response)
    end

    def holidays_for_year(date)
      response = self.get_holidays_for_year(date)
      self.vacation_days_from_response(response)
    end

    def holidays_for_date_range(from_date, to_date)
      response = self.get_holidays_for_date_range(from_date, to_date)
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
      self.get("/?action=getSupportedCountries")
    end

    def vacation_days_from_response(response)
      vacation_days = []
      response.each do |vacation_day|
        vacation_days.push( Enrico::VacationDay.new(vacation_day) )
      end
      vacation_days
    end

    def country_parameters(params, holiday_type: nil)
      {
        country: self.country_code,
        region: self.region
      }
      .merge(params)
      .tap { |result| result[:holidayType] = holiday_type if holiday_type.present? }
      .to_query
    end

    def is_public_holiday(date)
      params = country_parameters({date: date.strftime("%d-%m-%Y")})
      self.class.get("/?action=isPublicHoliday&#{params}")
    end

    def get_holidays_for_month(date, holiday_type: nil)
      params = country_parameters({month: date.month, year: date.year}, holiday_type: holiday_type)
      self.class.get("/?action=getHolidaysForMonth&#{params}")
    end

    def get_holidays_for_year(date, holiday_type: nil)
      params = country_parameters({year: date.year}, holiday_type: holiday_type)
      self.class.get("/?action=getHolidaysForYear&#{params}")
    end

    def get_holidays_for_date_range(from_date, to_date, holiday_type: nil)
      params = country_parameters({fromDate: from_date.strftime("%d-%m-%Y"), toDate: to_date.strftime("%d-%m-%Y")}, holiday_type: holiday_type)
      self.class.get("/?action=getHolidaysForDateRange&#{params}")
    end

  end
end
