class DynamicProgramming
  def initialize
    @blair_cache = {}
  end

  def blair_nums(n)
    @blair_cache[1] ||= 1
    @blair_cache[2] ||= 2
    return @blair_cache[1] if n == 1
    return @blair_cache[2] if n == 2
    @blair_cache[n-2] ||= blair_nums(n-2)
    @blair_cache[n-1] ||= blair_nums(n-1)
    @blair_cache[n-1] + @blair_cache[n-2] + (2*(n-1)-1)
  end

end

dp = DynamicProgramming.new
p dp.blair_nums(100)
