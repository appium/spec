# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

before_list = []

describe 'a' do
  t('') { before_list << 1 }
end

Minitest.run_specs