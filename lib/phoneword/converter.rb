module Phoneword
  class Converter
    def initialize(args={})
      @dictionary = Dictionary.new
      @phone = Phone.new(number: args[:phone])
    end

    def process
      results = []
      current_index = dictionary.word_size

      # TODO: iteration here
      digits = phone.digits[0..current_index]
      first, *tail = digits
      variations =
        phone.mapping[first].product(phone.mapping_array(tail)).map(&:join).map(&:upcase)
      results << (variations & dictionary.words)
    end

    private

    attr_reader :dictionary,
                :phone
  end
end
