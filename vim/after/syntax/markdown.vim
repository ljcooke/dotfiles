" https://habamax.github.io/2019/03/07/vim-markdown-frontmatter.html
unlet b:current_syntax
syntax include @yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@yaml
