# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') { '1' }
end

# no dots
class Minitest::ProgressReporter
  def record result
  end
end

Minitest.run_specs