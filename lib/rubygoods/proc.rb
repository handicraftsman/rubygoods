class Proc
  def moo
    2
  end
  def a_call(*args)
    pl = self.arity
    arr = Array.new(pl, nil)
    arr.each_index do |i|
      arr[i] = args[i]
    end
    self.call(*arr)
  end
end