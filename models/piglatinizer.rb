class PigLatinizer

    def piglatinize(string)
        string.split(" ").map {|w| piglatinize_word(w) }.join(" ")
    end

    def piglatinize_word(word)
        alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
        vowels = %w(a e i o u A E I O U)
        consonants = alphabet - vowels

        if vowels.include?(word[0])
            word + 'way'
        elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
            word[3..-1] + word[0..2] + 'ay'
        elsif consonants.include?(word[0]) && consonants.include?(word[1])
            word[2..-1] + word[0..1] + 'ay'
        elsif consonants.include?(word[0])
            word[1..-1] + word[0] + 'ay'
        else
            word
        end
    end
end

PigLatinizer.new.piglatinize("I")