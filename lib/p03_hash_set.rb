require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = num.hash % num_buckets
    @store[bucket] << num
    @count += 1
    resize! if count > num_buckets
  end

  def remove(num)
    bucket = num.hash % num_buckets
    if include?(num)
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = num.hash % num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = HashSet.new(num_buckets * 2)
    @store.flatten.each { |num| temp_store.insert(num) }
    @store = temp_store.store
  end
end
