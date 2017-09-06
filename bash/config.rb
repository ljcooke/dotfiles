#!/usr/bin/env ruby

require_relative '../_lib/helper.rb'

HOME_BASH_DIR = File.expand_path('~/.bash').freeze
HOME_BASHRC_PATH = File.expand_path('~/.bashrc').freeze
HOME_LOGIN_PATH = File.expand_path('~/.bash_login').freeze

GIT_BASH_DIR = File.expand_path("#{Dir.pwd}/bash").freeze

LINKS = {
  HOME_BASH_DIR => GIT_BASH_DIR,
  HOME_BASHRC_PATH => '.bash/bashrc',
  HOME_LOGIN_PATH => '.bash/login',
}.freeze

unless File.exist? GIT_BASH_DIR
  put_error "#{GIT_BASH_DIR} not found"
  exit(false)
end

def links_needed
  needed = []
  error = false
  LINKS.sort.each do |target, source|
    if File.symlink?(target) && File.readlink(target) == source
      puts "#{target} is linked to #{source}"
    elsif File.exist? target
      put_error "Cannot link #{target}, file exists"
      error = true
    else
      puts "OK to link #{target}, does not exist"
      needed << [source, target]
    end
  end
  exit(false) if error
  needed
end

def main
  put_status 'Checking bash setup'
  links = links_needed
  return true if links.empty?

  put_status 'Confirming'
  links.each do |source, target|
    puts "Link: #{PINK}#{target}#{OFF} -> #{CYAN}#{source}#{OFF}"
  end
  return false unless prompt_yn('Apply this configuration?')

  put_status 'Applying configuration'
  links.each do |source, target|
    puts "Linking #{target} -> #{source}"
    File.symlink(source, target)
  end
  true
end

exit(main) if $PROGRAM_NAME == __FILE__
