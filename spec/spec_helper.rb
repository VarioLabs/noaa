begin
  require 'rspec'
rescue LoadError => e
  if require 'rubygems' then retry
  else raise(e)
  end
end

require File.join(File.dirname(__FILE__), '..', 'lib', 'noaa')

# module NOAA
#   class TestCase < ::Test::Unit::TestCase
#   end
# end
