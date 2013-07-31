# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') { p 1 }
  t('') { 1.must_equal 2 }
  t('') { p 3 }
  t('') { p 4 }
end

begin
Minitest.run
rescue Exception => e
end