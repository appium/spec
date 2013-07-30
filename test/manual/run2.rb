# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

class MiniTest::Spec
  @@output = StringIO.new
  
  def self.output
    @@output
  end
  
  def p msg
    @@output.puts msg
  end
end

class SpecTest < MiniTest::Spec
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
end

options = {}
out = MiniTest::Spec.output
reporter = Minitest::CompositeReporter.new
reporter << Minitest::SummaryReporter.new(out, options)
reporter << Minitest::ProgressReporter.new(out, options)

Minitest.__run reporter, options

out.flush
out.rewind

actual = out.readlines.join ''
exp = <<'EXP'.strip
1
.2
.3
.4
.5
.6
.7
.-- before
8
.-- before
9
.-- before
10
.11
.12
.
EXP

puts actual.must_equal exp