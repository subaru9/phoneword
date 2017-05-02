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

        match_head = (variations(head_digits) & dictionary.words)
        match_tail = (variations(tail_digits) & dictionary.words)

        results << match_head << match_tail
        index += 1
      end
      results.compact
    end

    private

    def variations(digits)
      head, *tail = digits
      head_letters = phone.mapping[head]
      tail_letters = phone.mapping_array(tail)
      head_letters.product(*tail_letters).map(&:join).map(&:upcase)
    end

    attr_reader :dictionary,
                :phone
  end
end
