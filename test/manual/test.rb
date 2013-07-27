# encoding: utf-8

require 'rubygems'
require 'minitest'
require 'minitest/autorun'

def p msg
  puts msg
end

describe 'a' do
  t('') { p 1 }
  t('') { p 2 }
  t('') { p 3 }
  t('') { p 4 }
  t('') { p 5 }
  t('') { p 6 }
  t('') { p 7 }
end

describe 'b' do
  before { p '-- before' }
  t('z') { p 8 }
  t('b') { p 9 }
  t('a') { p 10 }
end

describe 'z' do
  t('a') { p 11 }
  t('z') { p 12 }
end