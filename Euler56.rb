def sumDigits(s)
	s.to_s.split('').map!(&:to_i).inject(&:+)
end

max = 0
[*1..99].each{|i| [*1..99].each{|j| max = [max,sumDigits(i**j)].max}}
p max