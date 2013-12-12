class LinkedListItem
  attr_accessor :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
  end

  def next_list_item=(arg)
    if(arg == self)
      raise "ArgumentError"
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
end
