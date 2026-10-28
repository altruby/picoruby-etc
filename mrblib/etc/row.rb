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
    #
    # @return [Time]
    attr_reader :password_expires_at

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

    ##
    # @return [Time]
    attr_reader :account_expires_at

    def initialize(
      name,
      password,
      uid,
      gid,
      password_expires_at,
      login_class,
      gecos,
      home,
      shell,
      account_expires_at
    )
      @name = name
      @password = password
      @uid = uid
      @gid = gid
      @password_expires_at = password_expires_at
      @login_class = login_class
      @gecos = gecos
      @home = home
      @shell = shell
      @account_expires_at = account_expires_at
    end
  end
end
