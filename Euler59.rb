# gem install 'raspell' . (needs libaspell)
# Aspell C extension for Ruby (Language Detection).

require 'raspell'
WordList = IO.readlines(File.dirname($0)+"/depen_files/cipher1.txt")
WordListArray = WordList[0].chomp.split(",").map(&:to_i)
spellcheck = Aspell.new('en_US')
spellcheck.set_option("ignore-case", "true")
passwords_list = [*"a".."z"].permutation(3).to_a.map{|x| x.map(&:ord)}
TempArray = []
begin
	passwords_list.each do |password_array|
		WordListArray.each_index do |i|
			TempArray[i] = i % 3 == 0 ? WordListArray[i] ^ password_array[0] : (i % 3 == 1 ? WordListArray[i] ^ password_array[1] : WordListArray[i] ^ password_array[2])
		end
		counter = 0
		TempArray.map(&:chr).join().split(/ /).each do |word|
			word.gsub!(/[!,#;?\']/,'')
			if spellcheck.check(word)
				counter += 1
			end
			if counter > TempArray.map(&:chr).join().split(/ /).length / 4
				puts password_array.map(&:chr).join()
				raise StopIteration	
			end
		end
	end
rescue StopIteration
	p "The Password has been found!"
	p TempArray.map(&:chr).join()
end