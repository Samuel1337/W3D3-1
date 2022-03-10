require "set"

class WordChainer

    def initialize(dic_file_name)
        file = File.open(dic_file_name)
        @dictionary = Set.new(file.readlines.map(&:chomp))
        file.close
    end

    def adjacent_words(word)
        arr = []
        alphabet = ("a".."z").to_a
        (0...word.length).each do |i| 
            alphabet.each do |char|
                new_word = word[0...i] + char + word[i+1..-1]
                if new_word != word && new_word.length == word.length && @dictionary.include?(new_word)
                    arr << new_word
                end
            end
        end
        arr
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {}
        @all_seen_words[source] = nil
        while @current_words.length > 0 && !@all_seen_words.include?(target)
            explore_current_words
        end
        var = build_path(target).reverse
        var.each { |ele| puts ele }
    end
    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                if !@all_seen_words.include?(adjacent_word)
                    # @all_seen_words.add(adjacent_word)
                    @all_seen_words[adjacent_word] = current_word
                    new_current_words << adjacent_word
                end
            end
        end
        @current_words = new_current_words
    end

    def build_path(target)
        path = []
        while target
            path << target
            target = @all_seen_words[target]
        end
        path
    end
end

chain = WordChainer.new("./dictionary.txt")
# p chain.adjacent_words("cat")
chain.run("duck", "ruby")
