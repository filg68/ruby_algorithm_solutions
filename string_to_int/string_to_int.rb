def string_to_int(str)

  powers = str.length - 1
  result = 0
  str.each_char do |c|
    num = case c
      when "0"; 0
      when "1"; 1
      when "2"; 2
      when "3"; 3
      when "4"; 4
      when "5"; 5
      when "6"; 6
      when "7"; 7
      when "8"; 8
      when "9"; 9
    end
  result += num * 10 ** powers
  powers -= 1
  end

  return result
end

str = "123984567894654313165"
ans = string_to_int(str)
exp = str.to_i
puts "Expected: #{exp}"
puts "Result:   #{ans}"
if ans == exp
  puts "Passed!"
else
  puts "Failed!"
end