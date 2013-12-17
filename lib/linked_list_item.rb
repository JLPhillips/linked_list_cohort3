class LinkedListItem
  include Comparable

  attr_reader :next_list_item
  attr_accessor :payload

  def initialize(payload)
    @payload = payload
    @next_list_item = nil
  end

  def next_list_item=(item)
    raise ArgumentError.new("Next item can't be self.") if item === self
    @next_list_item = item
  end

  def last?
    @next_list_item.nil?
  end

  def <=>(item)
    return 1 if @payload.is_a?(Symbol) && !item.payload.is_a?(Symbol)
    return -1 if @payload.is_a?(Symbol) && item.payload.is_a?(Symbol)
    @payload.to_s <=> item.payload.to_s
  end

  def ===(item)
    self.object_id == item.object_id
  end

end