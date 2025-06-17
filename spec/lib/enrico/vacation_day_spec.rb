# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::VacationDay do
  describe "default instance attributes" do
    it "test initializer methods" do
      beginning_of_year = Date.today.beginning_of_year
      rsp = {
        "date"=>{"day"=> beginning_of_year.day, "month" => beginning_of_year.month, "year"=>beginning_of_year.year, "dayOfWeek"=>beginning_of_year.wday},
        "name"=>[
          {
            "lang"=>"de",
            "text"=>"Neujahrstag"
          },
          {
            "lang"=>"en",
            "text"=>"New Year's Day"
          }
        ],
        "holidayType"=>"public_holiday"
      }
      day = Enrico::VacationDay.new(rsp)
      _(day.date).must_equal Date.today.beginning_of_year
      _(day.local_name).must_equal "Neujahrstag"
      _(day.english_name).must_equal "New Year's Day"
    end

    describe 'when country has only one language' do
      it "returns same names" do
        beginning_of_year = Date.today.beginning_of_year
        rsp = {
          "date"=>{"day"=> beginning_of_year.day, "month" => beginning_of_year.month, "year"=>beginning_of_year.year, "dayOfWeek"=>beginning_of_year.wday},
          "name"=>[
            {
              "lang"=>"en",
              "text"=>"New Year's Day"
            }
          ],
          "holidayType"=>"public_holiday"
        }
        day = Enrico::VacationDay.new(rsp)
        _(day.date).must_equal Date.today.beginning_of_year
        _(day.local_name).must_equal "New Year's Day"
        _(day.english_name).must_equal "New Year's Day"
      end

    end
  end
end
