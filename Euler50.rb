require 'Prime'

def primes_up_to(n)
	s = [nil, nil] + [*2..n]
	(2..(n ** 0.5).to_i).each { |i| (i ** 2).step(n, i) { |j| s[j] = nil } if s[i] }
	s.compact
end

limit = 1_000_000;some,longest = primes_up_to(limit),[]
0.upto(10) do |i|
	i.upto(some.length-1) do |j|
		cons = some[i..j];sum = cons.inject(&:+)
		break if sum > limit
		longest = cons if (j-i+1 > longest.length && sum.prime?)
	end
end 

p longest[0]