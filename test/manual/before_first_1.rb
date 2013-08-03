# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  before_first do
   '1'
  end
end

=begin
describe 'a' do
  before_first { '1' }
  before { '2' }
  t('') { '3' }
  after { '4' }
  after_last { '5' }
end
=end

# no dots
class Minitest::ProgressReporter
  def record result
  end
end

Minitest.run_specs