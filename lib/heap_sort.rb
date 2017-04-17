require_relative "heap"

class Array
  def heap_sort!
    orig = self.dup
    prc = Proc.new { |x, y| -1 * (x <=> y) }
    heap = BinaryMinHeap.new(&prc)
    self.each { |el| heap.push(el) }
    self.unshift(heap)
    result = []
    until self[0].count < 1
      el = self[0].extract
      self.push(el)
    end
    self.shift(orig.length + 1)
  end
end
