module Ccs

  class Calendar

    attr_reader :calendarname, :stime, :etime

    def initialize(calendarname = nil, stime, etime)
      @calendarname = calendarname
      @stime = Time.parse(stime)
      @etime = Time.parse(etime)
    end

  end

end
