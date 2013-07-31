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
    t('') { raise 'fail' }
    t('') { p 3 }
    t('') { p 4 }
  end
end

options = {}
out = MiniTest::Spec.output
reporter = Minitest::CompositeReporter.new
reporter << Minitest::SummaryReporter.new(out, options)
reporter << Minitest::ProgressReporter.new(out, options)

reporter.start

begin
  Minitest.__run reporter, options
  reporter.reporters.each { |r| r.report }
rescue Minitest::Runnable::ExitAfterFirstFail
end

out.flush
out.rewind

actual = out.readlines.join ''

exp = <<'EXP'
1
.E

Finished in 0s

  1) Error:
a#test_0002_:
RuntimeError: fail
    fail.rb:22:in `block (2 levels) in <class:SpecTest>'

2 runs, 0 assertions, 0 failures, 1 errors, 0 skips
EXP

puts actual.must_equal exp