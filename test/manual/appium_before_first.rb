# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  before_first do
    1.must_equal 2
  end
  t('') { puts 1 }
  t('') { 2.must_equal 3 }
  t('') { 4.must_equal 5 }
  t('') { puts 4 }
end

# no dots
class Minitest::ProgressReporter
  def record result
  end
end

Minitest.run_specs