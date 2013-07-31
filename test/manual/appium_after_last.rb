# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  after_last do
    1.must_equal 2
  end
  t('') { puts 1 }
end

describe 'b' do
  t('') { puts 2 }
end

# no dots
class Minitest::ProgressReporter
  def record result
  end
end

Minitest.run_specs