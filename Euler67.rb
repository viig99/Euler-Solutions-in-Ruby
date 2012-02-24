# Dynamic Traingle Addition from bottom to top

FileContents = IO.readlines(File.dirname($0)+"/depen_files/triangle.txt")
FileContentsNumber = FileContents.map{|x| x.split(' ').map(&:to_i)}
(FileContentsNumber.length-1).downto(0) do |i|
	0.upto(FileContentsNumber[i].length-2) do |j|
		FileContentsNumber[i-1][j] += [FileContentsNumber[i][j],FileContentsNumber[i][j+1]].max
	end
end
p FileContentsNumber[0][0]