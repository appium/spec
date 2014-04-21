require_relative '../../lib/spec'

describe 'test' do
  def run_once
    puts 'run once!'
    self.class.send :define_method, :run_once, proc {}
  end

  before { run_once }

  t '1' do
  end

  t '2' do
  end

  t '3' do
  end
end

trace_files = [File.expand_path(__FILE__)]
Minitest.run_specs({trace: trace_files})