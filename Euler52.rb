def combination(n,r)
		[*(n-r+1)..n].inject(&:*)/[*1..r].inject(&:*)
end

count = 0
23.upto(100) do |i|
	1.upto(i) do |j|
		count += 1 if combination(i,j) > 1_000_000
	end
end
p count