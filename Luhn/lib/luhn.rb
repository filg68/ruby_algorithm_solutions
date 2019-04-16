module Luhn
  def self.is_valid?(number)
    #write your solution here
    s_number = number.to_s.reverse
    total = 0
    i = 0

    s_number.each_char do |x|
       
      x = x.to_i

      if (i+1)%2 == 0
        x = x * 2
        if x >= 10
          x -= 9
        end
      end

       total = total + x
       i += 1
    end

    if total%10 == 0
      return true
    else
      return false
    end
  
  end
end

