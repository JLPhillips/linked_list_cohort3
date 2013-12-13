require "linked_list_item"

class LinkedList
  def initialize(*args)
    @count = 0
    @head = nil
    @current_item = nil

    if(args)
      args.each do |list_item|
        add_item(list_item)
      end
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    #lli.next_list_item = nil

    @current_item.next_list_item = lli if @current_item
    @current_item = lli

    @head = lli if @count == 0

    @count += 1
  end

  def get(index)
    raise IndexError if index < 0
    raise IndexError if index >= @count
    tmp = @head
    index.times do
      tmp = tmp.next_list_item
    end
    tmp.payload
  end

  def size
    return @count
  end

  def last
    @current_item.payload if @current_item
  end

  def to_s
    return "| |" if @count == 0

    list_items = "| "
    i = 0

    while (i < @count)
      list_items = list_items + get(i)
      list_items = list_items + ", " if i != @count-1
      i += 1
    end

    list_items = list_items + " |"
  end
end