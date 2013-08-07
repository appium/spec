# encoding: utf-8

require 'rubygems'
require 'stringio' # stdlib
require 'spec' # not 'minitest'

describe 'a' do
  t('') do
    def ok(&block); block.call; end
      a = ok do
            true
          end
      # should be true not nil
      $stdout.puts "a is nil? #{a.nil?}"
  end
end

Minitest.run_specs


$driver.public_methods(false).each do | m |
  MiniTest::Spec.class_eval do
    define_method m do | *args, &block |
      begin
        super(*args, &block)
      rescue NoMethodError
        $driver.send m, *args, &block if $driver.respond_to?(m)
      end
    end
  end
end