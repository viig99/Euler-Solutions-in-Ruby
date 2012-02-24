# We Have to Calculate the distances from the leftmost node to any node at the right end with the shortest path possible.
# I am Using the A* algorithm to achive this.
# Listening to "Love is a BattleField - Pat Benetar" in a permanent loop :D

WeightContents = IO.readlines(File.dirname($0)+"/depen_files/matrix82.txt")
weight = WeightContents.map{ |x| x.chomp.split(',').map(&:to_i)}  #Initialized the array of all the edges/weights.
n,m = weight.length,weight[weight.length-1].length
resultset = Array.new(n) {|i| Array.new(m,0)}  #Initialized the resultset to default 0 value.