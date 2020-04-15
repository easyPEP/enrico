# encoding: utf-8

module Enrico
  class VacationDay
    attr_accessor :date, :local_name, :english_name

    def initialize(args)
      self.date         = Date.new( args["date"]["year"].to_i, args["date"]["month"].to_i, args["date"]["day"].to_i  )
      self.local_name   = args["name"][0]["text"]
      self.english_name = args["name"][1].present? ? args["name"][1]["text"] : args["name"][0]["text"]
    end
  end
end
