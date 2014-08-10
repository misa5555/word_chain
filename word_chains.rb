class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = IO.readlines(dictionary_file_name).map{|e|e.chomp!}
  end



  def adjacent_words(word)
    @dictionary.each do |d_word|
      ad_words = []
      next unless d_word.length == word.length
      ad_words << d_word
    end
  end
end
