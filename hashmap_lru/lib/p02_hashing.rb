class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    return "[]".ord if self.length == 0
    result = 0
    bit_array = self.map.with_index do |el, i|
      if el.class == String
        string_bit = 0
        el.each_char do |char|
          string_bit += (char.ord * (i + 1))
        end
        string_bit
      elsif el.class == Array
        el.hash
      elsif el.class == Symbol
        el.to_s.ord * (i + 2)
      else
        el.ord * (i + 1)
      end
    end
    bit_array.inject(:+)
  end
end

class String
  def hash
    self.split('').hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.hash
  end
end
