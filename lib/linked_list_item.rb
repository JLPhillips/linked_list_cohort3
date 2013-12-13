class LinkedListItem
  include Comparable

  attr_accessor :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
  end

  def next_list_item=(arg)
    if(arg == self)
      raise ArgumentError
    else
      @next_list_item = arg
    end
  end
  def last?
    if @next_list_item == nil
      return true
    else
      return false
    end
  end

  def <=>(item)
    self.payload.to_s <=> item.payload.to_s
  end

  def ===(item)
    self.object_id === item.object_id
  end
end
