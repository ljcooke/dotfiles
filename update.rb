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
    puts 'Usage: ./script fileset [destination]'
    puts '  e.g. fileset = common, destination = me@server:'
    exit
end

fileset = ARGV[0].to_sym
dest = ARGV[1]

if fileset == :all
    dotfiles.each {|f| files += f}
elsif dotfiles.has_key? fileset
    files += dotfiles[fileset]
elsif aliases.has_key? fileset
    aliases[fileset].each {|fset|
        if fset.class == Symbol and dotfiles.has_key? fset
            files += dotfiles[fset]
        elsif fset.class == String
            files.push fset
        end
    }
end

if files.empty?
    puts 'No files selected!'; exit
end

if dest.nil?
    puts files
else
    Kernel::system ['rsync -Phavz',files,dest].join(' ')
end
