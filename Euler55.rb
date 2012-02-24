def palindrome?(n)
	n.to_s == n.to_s.reverse ? true : false
end

def lycherl?(s)
	50.times do
		s = s + s.to_s.reverse.to_i
		return false if palindrome?(s)
	end
	true
end

p [*1..10000].select{|x| lycherl?(x)}.length