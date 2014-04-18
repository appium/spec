require 'rubygems'
require 'spec'
describe 'test' do
  t 'simple spec test' do
    1.must_equal 1
  end
end

Minitest.after_run do
  puts 'minitest -- after run'
end

trace_files = [File.expand_path(__FILE__)]
Minitest.run_specs({trace: trace_files})