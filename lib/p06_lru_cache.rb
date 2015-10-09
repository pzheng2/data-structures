require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max # max elements in cache
    @prc = prc
  end

  def count
    @map.count
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

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    @store.remove(@store.last.key)
  end

end
