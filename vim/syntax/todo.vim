
syntax match todoCurrent  /^ *&.*$/
syntax match todoDefer    /^ *d.*$/
syntax match todoUrgent   /^ *\!.*$/
syntax match todoQuestion /^ *?.*$/
syntax match todoComplete /^ *x.*$/

highlight link todoCurrent Identifier
highlight link todoDefer Type
highlight link todoUrgent Todo
highlight link todoQuestion Statement
highlight link todoComplete Comment

