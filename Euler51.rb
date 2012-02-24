# Not solved yet

require 'Prime'

def primes_up_to(n,z=2)
	s = [nil, nil] + [*z..n]
	(2..(n ** 0.5).to_i).each { |i| (i ** 2).step(n, i) { |j| s[j] = nil } if s[i] }
	s.compact
end

# limit = 99999999
# x = Time.now()
# primes = primes_up_to(limit)
# p Time.now()-x

a = []
y = Time.now()
1_000_000_0.upto(99999999) do |p|
	a << p if p.prime?
end
p Time.now()-y