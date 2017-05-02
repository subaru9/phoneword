module Phoneword
  class Converter
    def initialize(args={})
      @dictionary = Dictionary.new
      @phone = Phone.new(number: args[:phone])
    end

    def process
      results = []
      index = dictionary.word_size

      while index < phone.number_size

        head_digits = phone.digits[0..index]
        tail_digits = phone.digits[index+1..phone.number_size]

        match_head = dictionary.search(variations(head_digits))
        match_tail = dictionary.search(variations(tail_digits))

        if match_head.empty? || match_tail.empty?
          index += 1
          next
        else
          results << match_head.product(match_tail)
          index += 1
        end
      end

      map_words(results.flatten(1)).sort(&sorting)
    end

    private

    def variations(digits)
      head, *tail = digits
      head_letters = phone.mapping[head]
      tail_letters = phone.mapping_array(tail)
      head_letters.product(*tail_letters).map do |variant|
        variant.join.upcase
      end
    end

    def map_words(results)
      results.map do |result|
        word = result.join
        if dictionary.search_word(word)
          word
        else
          result
        end
      end
    end

    def sorting
      Proc.new do |a, b|
        if a.is_a?(String) && b.is_a?(String)
          a <=> b
        elsif a.is_a?(String) && b.is_a?(Array)
          1
        elsif a.is_a?(Array) && b.is_a?(String)
          -1
        elsif a.is_a?(Array) && b.is_a?(Array)
          if (a[0] <=> b[0]) == 0
            a[1] <=> b[1]
          else
            a[0] <=> b[0]
          end
        end
      end
    end

    attr_reader :dictionary,
                :phone
  end
end
