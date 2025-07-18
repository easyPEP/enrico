# encoding: utf-8

require_relative '../../spec_helper'

describe Enrico::VacationDay do
  describe "initialization" do
    before(:each) do
      VCR.insert_cassette 'holidays_in_month'
    end
    
    after(:each) do
      VCR.eject_cassette
    end

    it "creates VacationDay from real API response" do
      country = Enrico::Country.new("deu")
      vacation_days = country.holidays_for_month(Date.parse('2020-01-15'))
      
      day = vacation_days.first
      _(day).must_be_instance_of Enrico::VacationDay
      _(day.date).must_equal Date.new(2020, 1, 1)
      _(day.local_name).must_equal "Neujahrstag"
      _(day.english_name).must_equal "New Year's Day"
    end

    it "handles multi-language holidays" do
      rsp = {
        "date"=>{"day"=>1, "month"=>1, "year"=>2020, "dayOfWeek"=>3},
        "name"=>[
          {"lang"=>"de", "text"=>"Neujahrstag"},
          {"lang"=>"en", "text"=>"New Year's Day"}
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.date).must_equal Date.new(2020, 1, 1)
      _(day.local_name).must_equal "Neujahrstag"
      _(day.english_name).must_equal "New Year's Day"
    end

    it "handles single-language holidays" do
      rsp = {
        "date"=>{"day"=>4, "month"=>7, "year"=>2020, "dayOfWeek"=>6},
        "name"=>[
          {"lang"=>"en", "text"=>"Independence Day"}
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.date).must_equal Date.new(2020, 7, 4)
      _(day.local_name).must_equal "Independence Day"
      _(day.english_name).must_equal "Independence Day"
    end

    it "falls back to local name when second language is nil" do
      rsp = {
        "date"=>{"day"=>25, "month"=>12, "year"=>2020, "dayOfWeek"=>5},
        "name"=>[
          {"lang"=>"fr", "text"=>"Noël"},
          nil
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.local_name).must_equal "Noël"
      _(day.english_name).must_equal "Noël"
    end

    it "falls back to local name when second language is empty" do
      rsp = {
        "date"=>{"day"=>1, "month"=>5, "year"=>2020, "dayOfWeek"=>5},
        "name"=>[
          {"lang"=>"es", "text"=>"Día del Trabajo"},
          {}
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.local_name).must_equal "Día del Trabajo"
      _(day.english_name).must_equal "Día del Trabajo"
    end

    it "parses dates with string values" do
      rsp = {
        "date"=>{"day"=>"15", "month"=>"8", "year"=>"2020", "dayOfWeek"=>6},
        "name"=>[
          {"lang"=>"it", "text"=>"Ferragosto"}
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.date).must_equal Date.new(2020, 8, 15)
    end
  end
end
