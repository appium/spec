# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('b') { 1 }
  t('c') { 2 }
end

Minitest.after_run do
  $stdout.puts 'after run!'
end

# Run specs and trace this file
Minitest.run_specs({ :trace => [__FILE__] })
