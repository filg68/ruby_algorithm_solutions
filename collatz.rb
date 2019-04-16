class Collatz
  attr_reader :max_len, :max_key, :max_seq

  def initialize
    @data = {}
    # each seq is stored as [starting seq, continuing seq, length]
    @data[1] = [[1], nil, 1]
    @max_len = 1
    @max_key = 1
    @max_seq = [1]
  end

  def seq_no_memoization(num)

    seq = []
    if num == 1
      return [1]
    end

    key = num
    seq = [key]
    
    while num != 1 do
      if num%2 == 0 
        num = num/2
      else
        num = (3 * num) + 1
      end
     
      seq += [num]
    end

    seq_len = seq.length
    if seq_len > @max_len
      @max_len = seq_len
      @max_key = key
      @max_seq = seq
    end

    return seq

  end

  def seq(num)

    seq = []
    if num == 1
      return @data[1][2]
    end

    key = num
    seq = [key]
    
    while num != 1 do
      if num%2 == 0 
        num = num/2
      else
        num = (3 * num) + 1
      end
      
      if @data[num] != nil
        seq_len = seq.length + @data[num][2]
        @data[key] = [seq, num, seq_len]
        num = 1
      else
        seq += [num]
        @data[key] = [seq,nil,seq.length]
        seq_len = seq.length
      end
     
    end

    if seq_len > @max_len
      @max_len = seq_len
      @max_key = key
    end

    return seq

  end

  def print_sequence(num)
    if @data[num] == nil
      puts "No sequence calculated for #{num}"
    end

    next_seq = num
    until next_seq == nil do
      print("#{@data[next_seq][0]} ")
      next_seq = @data[next_seq][1]
    end
  end

end

require 'benchmark'

collatz = Collatz.new
collatz2 = Collatz.new
Benchmark.bm do |x|
  x.report("memoization collatz") { (1..1000000).each do |n| collatz.seq(n) end }

  
  x.report("no memo collatz") { (1..1000000).each do |n| collatz2.seq_no_memoization(n) end }

end

puts "Memoization"
puts "max length: #{collatz.max_len} max_key: #{collatz.max_key}"
# collatz.print_sequence(collatz.max_key)

puts "No Memoization"
puts "max length: #{collatz2.max_len} max_key: #{collatz2.max_key}"
# print collatz2.max_seq
