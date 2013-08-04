require 'rubygems'
require 'method_source'

ary = []

class Test
  def self.run &block
    define_method :run_method do
      self.instance_eval &block
    end

    Test.new.run_method
  end
end

Test.run do
  ary << 1
  puts 'complete'
end