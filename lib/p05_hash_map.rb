require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count, :store

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  # put
  def set(key, val)
    resize! if count >= num_buckets
    @store[bucket(key)].insert(key, val)
    @count += 1
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    if @store[bucket(key)].include?(key)
      @store[bucket(key)].remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |linked_list|
      linked_list.each do |link|
        puts link
        link.nil? ? nil : yield(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = HashMap.new(num_buckets * 2)
    @store.each do |linked_list|
      linked_list.each do |link|
        temp_store.set(link.key, link.val)
      end
    end
    @store = temp_store.store
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
