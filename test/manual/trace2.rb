# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') { 1 }
  t('') { 2 }
  t('') { 3 }
  t('') { 4 }
end

# Run specs and trace this file
Minitest.run_specs({ :trace => [__FILE__] })
