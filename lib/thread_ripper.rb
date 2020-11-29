require "thread_ripper/version"
require "thread_ripper"

module ThreadRipper
  class Error < StandardError; end

  def self.call
    spawn
  end
end
