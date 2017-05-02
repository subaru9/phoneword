module Phoneword
  class Converter
    def initialize(args={})
      @dictionary = Dictionary.new
      @phone = Phone.new(number: args[:phone_number])
    end

    def process

    end
  end
end
