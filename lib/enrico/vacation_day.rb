# encoding: utf-8

module Enrico
  class VacationDay

    attr_accessor :date, :local_name, :english_name

    def initialize(args)
      self.date         = Date.new( args["date"]["year"].to_i, args["date"]["month"].to_i, args["date"]["day"].to_i  )
      self.local_name   = args["localName"]
      self.english_name = args["englishName"]
    end

  end
end
