require "linked_list_item"

class LinkedList

  def initialize(*args)
    @first_item = nil
    @count = 0
    for arg in args
      self.add_item(arg)
    end
  end

  def add_item(payload)
    item = @first_item
    if item
      while item.next_list_item do
        item = item.next_list_item
      end
      item.next_list_item = LinkedListItem.new(payload)
    else
      @first_item = LinkedListItem.new(payload)
    end
    @count += 1
  end

  def get(i)
    raise IndexError.new("Item must exist.") if i < 0
    raise IndexError.new("Linked List is empty.") unless @first_item
    item = @first_item
    i.times do
      raise IndexError.new("Index is out of range.") if item.nil?
      item = item.next_list_item
    end
    item.payload
  end

  def size
    @count
  end

  def last
    return nil unless @first_item
    item = @first_item
    while item.next_list_item do
      if item.next_list_item
        item = item.next_list_item
      end
    end
    return item.payload
  end

  def to_s
    return "| |" if @count <= 0
    open = "| "
    close = " |"

    item = @first_item
    content = [item.payload.to_s]
    while item.next_list_item do
      if item.next_list_item
        item = item.next_list_item
      end
      content.push(item.payload.to_s)
    end
    return open + content.join(", ") + close
  end

  def [](i)
    self.get(i)
  end

  def []=(i,val)
    raise IndexError.new("Item must exist.") if i < 0
    raise IndexError.new("Linked List is empty.") unless @first_item
    item = @first_item
    i.times do
      raise IndexError.new("Index is out of range.") if item.nil?
      item = item.next_list_item
    end
    item.payload = val
  end

  def remove i
    raise IndexError.new("Item must exist.") if i < 0
    raise IndexError.new("Linked List is empty.") unless @first_item
    item = @first_item
    for i in 0...i
      raise IndexError.new("Index is out of range.") unless item.next_list_item
      previous = item
      item = item.next_list_item
    end

    if item.next_list_item && previous
      previous.next_list_item = item.next_list_item
    elsif previous != item && previous
      previous.next_list_item = nil
    else
      @first_item = item.next_list_item ? item.next_list_item : nil
    end
    @count -= 1
  end

  def indexOf(obj)
    return nil unless @first_item
    item = @first_item
    i = 0
    while item.next_list_item do
      break if item.payload == obj
      item = item.next_list_item
      i = i + 1
    end
    return item.payload == obj ? i : nil
  end

  def sorted?
    return true unless @first_item
    item = @first_item
    one = item.payload
    while item.next_list_item do
      item = item.next_list_item
      two = item.payload
      sorted = one.to_s <=> two.to_s
      sorted = 1 if one.is_a?(Symbol) && !two.is_a?(String)
      return false if sorted == 1
    end
    return true
  end

  def sort
    size = self.size
    sorted = size == 0 ? true : false
    while !sorted
      sorted = true
      for i in 0...size -1
        one = get(i)
        two = get(i+1)
        if one.is_a?(Symbol) && !two.is_a?(Symbol)
          swap_with_next(i)
          sorted = false
        elsif one.to_s > two.to_s && !two.is_a?(Symbol)
          swap_with_next(i)
          sorted = false
        end
      end
    end
    return self
  end

  def swap_with_next(i)
    raise IndexError.new("Item must exist.") if i < 0
    raise IndexError.new("Linked List is empty.") unless @first_item
    item = @first_item
    for i in 0..i
      raise IndexError.new("Index is out of range.") unless item.next_list_item
      previous = item
      item = item.next_list_item
    end
    item.payload, previous.payload = previous.payload, item.payload
  end
end






















