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

    ##
    # @return [String]
    attr_reader :login_class

    ##
    # @return [String]
    attr_reader :gecos

    ##
    # @return [String]
    attr_reader :home

    ##
    # @return [String]
    attr_reader :shell

    def initialize(
      name,
      password,
      uid,
      gid,
      password_changed_at,
      login_class,
      gecos,
      home,
      shell
    )
      @name = name
      @password = password
      @uid = uid
      @gid = gid
      @login_class = login_class
      @gecos = gecos
      @home = home
      @shell = shell
    end
  end
end
