class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.inspect.hash

  end
end

class String
  def hash
    self.split("").map(&:ord).join.to_i
  end
end

class Hash
  def hash
    self.sort.to_h.inspect.hash
  end
end
