# encoding: utf-8

require 'rubygems'
require 'spec'

describe 'a' do
  t('b') { sleep 999 }
end

Minitest.after_run { $stdout.puts("after_run") }
Minitest.run_specs({ :trace => [__FILE__] })