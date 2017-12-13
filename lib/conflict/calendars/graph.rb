module Ccs
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
