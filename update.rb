#!/usr/bin/env ruby
#
# Update dotfiles on another server
#
aliases = {
    :common => [:bash, :python, :ruby, :vim],
    :editor => [:vim, '.nanorc'],
}
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
files = []
args = ARGV.clone
dry_run = false

if ['-n', '--dry-run'].include? args[0]
    dry_run = true
    args.delete_at 0
end

if args.empty?
    puts 'Usage: ./script [--dry-run] [fileset] destination'
    puts '  e.g. fileset = bash, destination = me@server:'
    exit
end

dest = args[-1]
fileset = :common
if not args[-2].nil?
    fileset = args[-2].to_sym
end

if fileset == :all
    dotfiles.each {|f| files += f}
elsif dotfiles.has_key? fileset
    files += dotfiles[fileset]
elsif aliases.has_key? fileset
    aliases[fileset].each do |fset|
        if fset.class == Symbol and dotfiles.has_key? fset
            files += dotfiles[fset]
        elsif fset.class == String
            files.push fset
        end
    end
end

if dry_run
    puts "fileset: " + fileset.to_s
    puts files.collect{|f| '  '+f}.join("\n") unless files.empty?
elsif not files.empty?
    Kernel::system ['rsync -FPhacvz --exclude .git', files, dest].join(' ')
end
