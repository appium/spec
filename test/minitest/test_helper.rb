# Disable fail on first failure
class Minitest::Runnable
  def self.check_failures result, reporter
  end
end

# Disable source rewriting
module Minitest
  def self._rewrite_source source
    source
  end
end

# Restore summary reporter's output
class Minitest::SummaryReporter < Minitest::StatisticsReporter
  def start # :nodoc:
    super

    io.puts "Run options: #{options[:args]}"
    io.puts
    io.puts "# Running:"
    io.puts

    self.sync = io.respond_to? :"sync=" # stupid emacs
    self.old_sync, io.sync = io.sync, true if self.sync
  end
end