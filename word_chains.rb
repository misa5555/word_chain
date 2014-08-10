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

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source=>nil} 
    
    until @current_words.empty?
      new_current_words = explore_current_words
    end
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacents = adjacent_words(current_word)
      adjacents.each do |adjacent_word|
        unless @all_seen_words.include?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = current_word
        end
      end
      #print new_current_words,"\n"
      @current_words = new_current_words
      new_current_words.each do |word|
        print word, ":", @all_seen_words[word], "\n"
      end
    end
  end

  def build_path(target)
    path = []
    unless 

  end
end

w = WordChainer.new("dictionary.txt")
p w.adjacent_words("ink")
p w.run("market", "hat")
