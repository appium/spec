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
    t('') { 1.must_equal 2 }
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
.F

Finished in 0s

  1) Failure:
a#test_0002_ [assert.rb:22]:
Expected: 2
  Actual: 1

2 runs, 1 assertions, 1 failures, 0 errors, 0 skips
EXP

puts actual.must_equal exp