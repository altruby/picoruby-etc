module Etc
  extend Enumerable
  def self.each(&)
    rows.each(&)
  end
end
