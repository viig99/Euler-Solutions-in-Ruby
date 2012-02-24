# Manhattan tourist Problem -- minimal path of matrix traversal using right and bottom only.

WeightContents = IO.readlines(File.dirname($0)+"/depen_files/matrix.txt")
weight = WeightContents.map{ |x| x.chomp.split(',').map(&:to_i)}
n,m = weight.length,weight[weight.length-1].length
resultset = Array.new(n) {|i| Array.new(m,0)}
resultset[0][0] = weight[0][0] # First node itself has some weight to it.
1.upto(n-1) do |i|
	resultset[i][0] = resultset[i-1][0] + weight[i][0]
end
1.upto(m-1) do |j|
	resultset[0][j] = resultset[0][j-1] + weight[0][j]
end
1.upto(n-1) do |i|
	1.upto(m-1) do |j|
		resultset[i][j] = [resultset[i-1][j]+weight[i][j],resultset[i][j-1]+weight[i][j]].min
	end
end
p resultset[n-1][m-1]