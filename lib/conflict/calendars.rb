require "conflict/calendars/version"

module Ccs
	
	class Calendar

		attr_reader :name, :start_time, :end_time

		def initialize(cname = nil,start_time,end_time)
			@name = cname
			@start_time = start_time
			@end_time = end_time
		end

	end


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
				comb if overlaps(calendar_first.start_time,calendar_first.end_time,calendar_last.start_time,calendar_last.end_time)
			end.compact!
			@conflicts = Graph.new(result).find_maximum_cliques
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

	class Graph
	  def initialize(edges)
	    @edges = edges
	  end

	  def find_maximum_cliques
	    @cliques ||= []
	    bron_kerbosch(Set.new, nodes, Set.new) if @cliques.empty?

	    @cliques
	  end

	  private

	  def nodes
	    @nodes ||= @edges.flatten.uniq
	  end

	  def neighbours
	    @neighbours ||= nodes.map do |node|
	      node_neighbours =
	        @edges.select { |edge| edge.include? node }.flatten - [node]

	      [node, node_neighbours]
	    end.to_h
	  end

	  def bron_kerbosch(re, pe, xe)
	    @cliques << re if pe.empty? && xe.empty?

	    pe.each do |ve|
	      bron_kerbosch(re | [ve], pe & neighbours[ve], xe & neighbours[ve])
	      pe -= [ve]
	      xe |= [ve]
	    end
	  end
	end  

end
