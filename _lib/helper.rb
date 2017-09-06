# frozen_string_literal: true

require 'shellwords'

YELLOW = "\x1b[33m".freeze
BLUE = "\x1b[34m".freeze
PINK = "\x1b[35m".freeze
CYAN = "\x1b[36m".freeze
WHITE = "\x1b[37m".freeze
BOLD = "\x1b[1m".freeze
OFF = "\x1b[0m".freeze

def heading(msg)
  puts "#{BOLD}#{BLUE}==>#{OFF} #{BOLD}#{msg}#{OFF}"
end

def prompt_yn(msg)
  input = ''
  keys = 'ynq'
  until !input.empty? && keys.include?(input)
    print "#{msg} #{WHITE}[#{keys}]#{OFF} "
    STDOUT.flush
    input = gets.strip.downcase
  end
  exit(1) if input == 'q'
  input == 'y'
end

def run_command(args)
  args = args.compact
  puts "$ #{args.shelljoin}"
  system(*args)
end
