ary = []

class Test
  def self.run &block
    define_method :run_method do
      # eval %(ary << 1; puts 'complete'), block.binding
      new_src = "ary << 1\nputs 'complete'"
      block = eval("Proc.new { #{new_src} }", block.binding)
      self.instance_eval &block
    end

    puts 'calling run method'
    Test.new.run_method
  end
end

Test.run do
  ary << 1
  puts 'complete'
end