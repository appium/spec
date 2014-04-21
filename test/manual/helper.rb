require_relative '../../lib/spec'

require 'stringio'

def capture no_args=nil
  @capture ||= StringIO.new
end

trace_files = Dir.glob("#{__dir__}/*_spec.rb")
Minitest.run_specs({ trace: trace_files, io: capture })

output = capture.string
puts output