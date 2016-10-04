class CartesianProduct
  include Enumerable

  def initialize(seqA, seqB)
    @cartesian = []
    seqA.each do |a|
      seqB.each do |b|
        @cartesian.push([a, b])
      end
    end
  end
  
  def each
    @cartesian.each {|c| yield c}
  end
end
