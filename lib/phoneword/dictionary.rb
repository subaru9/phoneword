module Phoneword
  class Dictionary
    def initialize(args={})
      @file_path = args.fetch(:file_path, File.expand_path('../../../data/dictionary.txt', __FILE__))
    end

    def words
      @words ||=
        File.readlines(file_path).each { |w| w.chomp! }
    end

    def word_size
      @word_size ||= 2
    end

    private

    attr_reader :file_path
  end
end
