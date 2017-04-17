module Ccs

  class Conflicts

    include Enumerable

    def initialize(*calendars)
      @calendars = calendars
      compute!
    end

    def inspect
      "#<Ccs::Conflict:#{'0x00%x' % (object_id << 1)} {#{@conflicts.size}}>"
    end 

    def compute!
      result = @calendars.combination(2).to_a.map do |comb|
        calendar_first = comb.first
        calendar_last = comb.last
        comb if overlaps(calendar_first.stime, calendar_first.etime, calendar_last.stime, calendar_last.etime)
      end.compact
      @conflicts = Ccs::Graph.new(result).find_maximum_cliques
    end

    def each(&block)                      
      @conflicts.each(&block)       
    end

    def size
      @conflicts.size
    end

    private

    def overlaps(t1_start,t1_end,t2_start,t2_end)
      if (t1_start - t2_end) * (t2_start - t1_end) >= 0
        return true
      else
        return false
      end
    end

  end

end