

class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  include Enumerable

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    cur = @head

    until cur.nil? || cur.next.nil?
      cur = cur.next
    end

    cur
  end

  def empty?
    @head.nil?
  end

  def get(key)
    cur = @head
    until cur.nil? || cur.key == key
      cur = cur.next
    end

    return cur.val unless cur.nil?
    nil
  end

  def include?(key)
    cur = @head
    until cur.nil? || cur.key == key
      cur = cur.next
    end

    !cur.nil?
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    if @head.key.nil?
      @head = new_link
    else
      last.next = new_link
    end
  end

  def remove(key)

    if include?(key)
      if @head.key == key
        @head = @head.next
      else
        before_link = @head
        cur_link = @head.next

        until cur_link.nil? || cur_link.key == key
          before_link = before_link.next
          cur_link = cur_link.next
        end


        before_link.next = cur_link.next
      end
    end

  end

  def each
    cur = @head

    until cur.nil?
      yield(cur)
      cur = cur.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
