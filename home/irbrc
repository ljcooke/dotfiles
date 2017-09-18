# -----------------------------------------------------------------------------
# Ruby repl (irb) config
# -----------------------------------------------------------------------------

require 'irb/completion'


module Term
  RESET  = "\x1b[0m".freeze
  BOLD   = "\x1b[1m".freeze
  DIM    = "\x1b[2m".freeze
  UNBOLD = "\x1b[21m".freeze
  UNDIM  = "\x1b[22m".freeze
  RED    = "\x1b[31m".freeze
  GREEN  = "\x1b[32m".freeze
  YELLOW = "\x1b[33m".freeze
  BLUE   = "\x1b[34m".freeze
  PINK   = "\x1b[35m".freeze
  CYAN   = "\x1b[36m".freeze
end

module MyPrompt
  def self.ps1
    version = RUBY_VERSION.match(/^([^.]+\.[^.])/)[1]
    ["#{Term::DIM}(#{Term::UNDIM}",
     "rb#{version}",
     "#{Term::DIM})#{Term::UNDIM}",
     "#{Term::BLUE}>#{Term::RESET}",
     ' '].join
  end

  def self.ps2
    "#{Term::BLUE}.#{Term::RESET} "
  end

  def self.result
    "#{Term::DIM}=#{Term::UNDIM} "
  end
end

IRB.conf[:PROMPT][:ARAILE] = {
  :PROMPT_I => MyPrompt.ps1,  # normal
  :PROMPT_S => MyPrompt.ps2,  # continuing strings
  :PROMPT_C => MyPrompt.ps2,  # continuing statements
  :RETURN => "#{MyPrompt.result}%s\n",
}

IRB.conf[:PROMPT_MODE] = :ARAILE


# http://blog.evanweaver.com/articles/2006/12/13/benchmark/
def benchmark(times = 1000, samples = 20)
  times *= samples
  cur = Time.now
  result = times.times { yield }
  print "#{cur = (Time.now - cur) / samples.to_f } seconds"
  puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
  $last_benchmark = cur
  result
end
