require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @map = HashMap.new
    @store = LinkedList.new
    @count = 0
  end

  def [](i)
    @map[i]
  end

  def []=(i, val)
    @map[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def get(key)
    if @map.include?(key)
      return @map[key]
    end
    val = @prc.call(key)
    @store.insert(key, val)
    @map.set(key, @store.get(key))
    eject! if count > @max

    val
  end

  def push(val)
    @store[count] = val
    @count += 1
  end

  def unshift(val)
    return nil unless include?(val)
    (count - 1).downto(0).each do |index|
      @store[index + 1] = @store[index]
    end
    @store[0] = val
    @count += 1

  end

  def pop
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
