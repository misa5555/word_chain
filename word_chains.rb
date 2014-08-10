require 'set'
class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = IO.readlines(dictionary_file_name).map{|e|e.chomp!}.to_set
  end

  def adjacent_words(word)
    adjacent_words = []
    word.each_char.each_with_index do |old_char, idx|
      ("a".."z").each do |new_char|
        next if old_char == new_char
        new_word = word.dup
        new_word[idx] = new_char
        adjacent_words << new_word if @dictionary.include?(new_word)
      end
    end
    adjacent_words
  end

end

w = WordChainer.new("dictionary.txt")
p w.adjacent_words("bat")

