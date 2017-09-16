#!/usr/bin/env ruby

require 'shellwords'
require 'yaml'

BOLD = "\x1b[1m".freeze
PINK = "\x1b[0;35m".freeze
OFF = "\x1b[0m".freeze

def run(*args)
  puts args.shelljoin
  system(*args)
end

def update(plugins = [])
  YAML::load_file('vim/bundle/SOURCES.yaml').each do |key, attrs|
    next if plugins.any? && !plugins.include?(key)
    url = attrs['git']
    branch = attrs['branch'] || 'master'
    puts "#{BOLD}#{key}#{OFF} #{PINK}#{url}#{OFF}"
    run('git', 'subtree', 'pull',
        '--prefix', "vim/bundle/#{key}",
        url, branch, '--squash')
  end
end

update(ARGV) if $PROGRAM_NAME == __FILE__
