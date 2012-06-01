# Simple Solution

max = x_end = y_end = 0
limit = 2_000_000
[*0...100].each do |x|
	[*0...100].each do |y|
		sum = (x**2+x)*(y**2+y)/4  # From Wikipedia
		max,x_end,y_end = [max,sum].max,x,y if (max < limit)			
	end
end
p (x_end*y_end)