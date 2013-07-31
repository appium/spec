# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') { puts 1 }
  t('') { 1.must_equal 2 }
  t('') { puts 3 }
  t('') { puts 4 }
end

Minitest.run_specs