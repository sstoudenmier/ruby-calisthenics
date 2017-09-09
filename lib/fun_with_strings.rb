module FunWithStrings
  def palindrome?
    self.downcase.gsub(/\W/, "") == self.reverse.downcase.gsub(/\W/, "")
  end
  
  def count_words
    word_count = Hash.new
    self.split.each do |word|
      word.downcase!
      word.gsub!(/\W/,"")
      if word == ""
        next
      elsif word_count.include? word
        word_count[word] += 1
      else
        word_count[word]= 1
      end
    end
    word_count
  end
  
  def count_letters
    letter_count = Hash.new
    self.downcase!
    self.gsub!(/\W/, "")
    self.chars do |char|
      if letter_count.include? char
        letter_count[char] += 1
      else
        letter_count[char] = 1
      end
    end
    letter_count
  end
  
  
  def anagram_groups
    # your code here
    anagrams = []
    self.split.each do |word|
      word.downcase!
      word.gsub!(/\W/, "")
      if anagrams.length == 0
        anagrams << [word]
        next
      end
      anagrams.each do |index|
        if index[0].count_letters == word.count_letters
          index << word
          break
        end
      end
      anagrams << [word]
    end
    anagrams
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
