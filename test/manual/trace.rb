# from http://apidock.com/ruby/Kernel/set_trace_func

 class Test
  def test
    a = 1
    b = 2
  end
  end

  $lines = IO.readlines('trace.rb')
  $last_line = -1
  set_trace_func proc { |event, file, line, id, binding, classname|
     if file == 'trace.rb' && $last_line != line
       puts "#{line}: #{$lines[line-1]}"
       $last_line = line
     end
  }
  t = Test.new
  t.test