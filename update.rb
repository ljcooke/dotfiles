#!/usr/bin/env ruby
#
# Update dotfiles on another server
#
dotfiles = {
    :bash => ['.bash', '.bashrc', '.inputrc'],
    :irc => ['.irssi'],
    :lineak => ['.lineak'],
    :mplayer => ['.mplayer'],
    :python => ['.pythonrc.py'],
    :ruby => ['.irbrc'],
    :screen => ['.screenrc'],
    :vim => ['.vimrc', '.vim'],
    :x => ['.XCompose'],
}
aliases = {
    :common => [:bash, :python, :ruby, :vim],
    :editor => [:vim, '.nanorc'],
}
files = []

if not [1,2].include? ARGV.length
    puts 'Usage: ./script [fileset] destination'
    puts '  e.g. fileset = bash, destination = me@server:'
    exit
end

dest = ARGV[-1]
fileset = :common
if not ARGV[-2].nil?
    fileset = ARGV[-2].to_sym
end

if fileset == :all
    dotfiles.each {|f| files += f}
elsif dotfiles.has_key? fileset
    files += dotfiles[fileset]
elsif aliases.has_key? fileset
    aliases[fileset].each do |fset|
        case fset.class
        when Symbol
            files += dotfiles[fset] if dotfiles.has_key? fset
        when String
            files.push fset
        end
    end
end

unless files.empty?
    Kernel::system ['rsync -FPhavz',files,dest].join(' ')
end
