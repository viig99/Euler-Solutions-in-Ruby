# This is a Coin Change Problem
require 'Prime'
def getCount(number,primes_array)
	n,m = number,primes_array.length-1
	table = Array.new(n+1) {|i| Array.new(m+1,1)}
	1.upto(n) do |i|
		0.upto(m) do |j|
			table[i][j] = (j-1 < 0 ? 0 : table[i][j-1]) + (i-primes_array[j] < 0 ? 0 : table[i-primes_array[j]][j])
		end
	end
	table[n][m] 
end
x,count = 0,10
while x <= 5000
	count += 1
	x = getCount(count,Prime.each(count).to_a)
end
p count