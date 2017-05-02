module Phoneword
  class Dictionary
    def initialize(args={})
      @file_path = args.fetch(:file_path, File.expand_path('../../../data/dictionary.txt', __FILE__))
    end

    def words
      @words ||=
        File.readlines(file_path).each { |w| w.chomp! }
    end

    private

    attr_reader :file_path
  end
end
