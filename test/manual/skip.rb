# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') { puts 1 }
  t('') { skip }
  t('') { puts 3 }
  t('') { skip }
  t('') { puts 5 }
end

Minitest.run_specs({ trace: [__FILE__], verbose: true })