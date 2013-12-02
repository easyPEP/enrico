# encoding: utf-8

require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe Enrico::VacationDay do

  describe "default instance attributes" do
    let(:vacatin_date) {
      Enrico::VacationDay.new(Date.today.beginning_of_year, "Neujahrstag", "New Year's Day")
    }

    it "test initializer methods" do
      beginning_of_year = Date.today.beginning_of_year
      rsp = {"date"=>{"day"=> beginning_of_year.day, "month" => beginning_of_year.month, "year"=>beginning_of_year.year, "dayOfWeek"=>beginning_of_year.wday}, "localName"=>"Neujahrstag", "englishName"=>"New Year's Day"}
      day = Enrico::VacationDay.new(rsp)
      day.date.must_equal Date.today.beginning_of_year
      day.local_name.must_equal "Neujahrstag"
      day.english_name.must_equal "New Year's Day"
    end

    it "test initializer methods" do
      beginning_of_year = Date.today.beginning_of_year
      rsp = {"date"=>{"day"=> beginning_of_year.day, "month" => beginning_of_year.month, "year"=>beginning_of_year.year, "dayOfWeek"=>beginning_of_year.wday}, "localName"=>"Neujahrstag", "englishName"=>"New Year's Day"}
      day = Enrico::VacationDay.new(rsp)
      day.date.must_equal Date.today.beginning_of_year
      day.local_name.must_equal "Neujahrstag"
      day.english_name.must_equal "New Year's Day"
    end

  end

end
