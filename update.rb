#!/usr/bin/env ruby
#
# Update dotfiles on another server
#
dotfiles = {
    'bash' => ['.bashrc', '.inputrc'],
    'python' => ['.pythonrc.py'],
    'ruby' => ['.irbrc'],
    'screen' => ['.screenrc'],
    'vim' => ['.vimrc', '.vim'],
    'x' => ['.XCompose'],
}
aliases = {
    'all' => :all,
    'common' => ['bash', 'python', 'ruby', 'vim'],
    'editor' => ['vim', '.nanorc'],
}
cmd = 'rsync -Phavz'

files = []

if not [1,2].include? ARGV.length
    puts 'Usage: ./script fileset [destination]'
    puts '  e.g. fileset = common, destination = me@server:'
    exit
end

fileset, dest = ARGV

if dotfiles.has_key? fileset
    files += dotfiles[fileset]
elsif aliases.has_key? fileset
    a = aliases[fileset]
    if a == :all
        dotfiles.each {|f| files += f}
    else
        a.each {|fs|
            if dotfiles.has_key? fs
                files += dotfiles[fs]
            end
        }
    end
end

if files.empty?
    puts 'No files selected!'; exit
end

if dest.nil?
    puts files
else
    Kernel::system ['rsync -Phavz',files,dest].join(' ')
end
