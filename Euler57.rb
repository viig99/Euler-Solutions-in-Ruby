# gem install 'gmp' (needs libgmp and libmpfr)
# GMP C extension for Ruby which provides artbitarty precision mathematics.
# Using floats here for finding the number of digits in the number using the base 10 logarithm.

require 'gmp'
count,p,q = 0,GMP::F.new(1),GMP::F.new(1)
[*1..1000].each do |i|
	p,q = p+2*q,p+q
	count += 1 if p.log10.floor+1 > q.log10.floor+1
end
p count