module Etc
  class Row
    ##
    # @return [String]
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end
end
