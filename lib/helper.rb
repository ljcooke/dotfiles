# frozen_string_literal: true

require 'shellwords'

RED = "\x1b[31m".freeze
GREEN = "\x1b[32m".freeze
YELLOW = "\x1b[33m".freeze
BLUE = "\x1b[34m".freeze
PINK = "\x1b[35m".freeze
CYAN = "\x1b[36m".freeze
WHITE = "\x1b[37m".freeze
BOLD = "\x1b[1m".freeze
OFF = "\x1b[0m".freeze

def macos?
  `uname`.split.first == 'Darwin'
end

def put_status(msg)
  puts "#{BOLD}#{BLUE}==>#{OFF} #{BOLD}#{msg}#{OFF}"
end

def put_error(msg)
  STDERR.puts "#{RED}Error:#{OFF} #{msg}"
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
  yield input == 'y'
end

def run_command(args)
  args = args.compact
  puts "$ #{args.shelljoin}"
  system(*args)
end
