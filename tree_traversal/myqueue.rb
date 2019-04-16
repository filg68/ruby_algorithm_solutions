class MyQueue
  attr_reader :items
  def initialize
    @queue = []
    @items = 0
  end

  def enqueue(item)
    @queue.push(item)
    @items += 1
  end

  def dequeue
    
    if @items > 0
      @items -= 1
    end
    
    return @queue.shift
  end

  def is_empty?
    if @items == 0
      true
    else
      false
    end
  end
end
