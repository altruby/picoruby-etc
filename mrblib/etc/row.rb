module Etc
  class Row
    ##
    # @return [String]
    attr_reader :name

    ##
    # @return [String]
    attr_reader :password

    ##
    # @return [Integer]
    attr_reader :uid

    ##
    # @return [Integer]
    attr_reader :gid

    def initialize(
      name,
      password,
      uid,
      gid
    )
      @name = name
      @password = password
      @uid = uid
      @gid = gid
    end
  end
end
