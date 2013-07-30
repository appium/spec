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
    before_first { p '-- before_first' }
    after_last { p '-- after_last' }
    t('') { p 1 }
    t('') { p 2 }
    t('') { p 3 }
    t('') { p 4 }
    t('') { p 5 }
    t('') { p 6 }
    t('') { p 7 }
  end

  describe 'b' do
    t('') { p 8 }
    t('') { p 9 }
  end

  describe 'c' do
    before { p '-- before' }
    after { p '-- after' }
    t('') { p 10 }
    t('') { p 11 }
    t('') { p 12 }
  end

  describe 'd' do
    t('') { p 13 }
    t('') { p 14 }
  end
end

options = {}
out = MiniTest::Spec.output
reporter = Minitest::CompositeReporter.new
reporter << Minitest::SummaryReporter.new(out, options)
reporter << Minitest::ProgressReporter.new(out, options)
#reporter.start

Minitest.__run reporter, options

#reporter.report
out.flush
out.rewind

actual = out.readlines.join ''
exp = <<'EXP'.strip
-- before_first
1
.2
.3
.4
.5
.6
.7
.-- after_last
8
.9
.-- before
10
-- after
.-- before
11
-- after
.-- before
12
-- after
.13
.14
.
EXP

puts actual.must_equal exp