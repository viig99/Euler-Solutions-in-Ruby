# gem install 'gmp' (needs libgmp and libmpfr)
# GMP C extension for Ruby which provides artbitarty precision mathematics.

require 'gmp'
a = GMP::Z.new(1)
b = GMP::Z.pow(2,7830457) 
a.addmul!(b,28433)
intbase = a.sizeinbase(10)
p a.to_s.slice!(intbase-10,intbase)