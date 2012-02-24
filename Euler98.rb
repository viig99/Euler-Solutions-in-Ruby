# Word Squares Problem

WordList = IO.readlines(File.dirname($0)+"/depen_files/words.txt")
WordList[0] = WordList[0].chomp.split(",").map{|x| x.gsub(/\"/,'').downcase}
min_letters,max_letters = 100,0
p WordList[0]
WordList[0].each do |word|
	min_letters = [min_letters,word.length].min
	max_letters = [max_letters,word.length].max
end
SquareArray = Array.new(14) {|x| Array.new(0)}
# WordListDictionary.each{|key,value| max = [max,value.length].max}
# thekey = WordListDictionary.select{ |k,v| v.length == max }.keys.join()
# p thekey,max,WordListDictionary[thekey]