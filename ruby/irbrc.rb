# frozen_string_literal: true

# -----------------------------------------------------------------------------
# Ruby repl (irb) config
# -----------------------------------------------------------------------------

require 'irb/completion'

def measure_time
  t_start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  result = yield
  t_end = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  puts "#{'%.6f' % (t_end - t_start)} s"
  result
end

# Terminal color helpers
module Term
  RESET  = "\x1b[0m"
  BOLD   = "\x1b[1m"
  DIM    = "\x1b[2m"
  UNBOLD = "\x1b[21m"
  UNDIM  = "\x1b[22m"
  RED    = "\x1b[31m"
  GREEN  = "\x1b[32m"
  YELLOW = "\x1b[33m"
  BLUE   = "\x1b[34m"
  PINK   = "\x1b[35m"
  CYAN   = "\x1b[36m"

  def self.color(string, color, uncolor = RESET)
    "#{color}#{string}#{uncolor}"
  end

  def self.dim(string)
    "#{DIM}#{string}#{UNDIM}"
  end
end

# Custom prompt showing the Ruby version number
module MyPrompt
  VERSION = RUBY_VERSION.match(/^([^.]+\.[^.])/)[1]
  PROMPT = "(rb#{VERSION})>"
  PS1 = "#{PROMPT} "
  PS2 = ('.' * PROMPT.size) + ' '

  def self.config
    {
      PROMPT_I: PS1, # normal
      PROMPT_S: PS2, # continuing strings
      PROMPT_C: PS2, # continuing statements
      RETURN: "= %s\n"
    }
  end
end

IRB.conf[:PROMPT][:LJCOOKE] = MyPrompt.config
IRB.conf[:PROMPT_MODE] = :LJCOOKE
