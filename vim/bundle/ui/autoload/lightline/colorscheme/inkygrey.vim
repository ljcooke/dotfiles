" Variant of base16-eighties
" based on lightline/autoload/lightline/colorscheme/wombat.vim

let s:base03  = ['#2d2d2d', 235]
let s:base023 = ['#393939', 236]
let s:base02  = ['#444444', 238]
let s:base01  = ['#585858', 240]
let s:base00  = ['#666666', 242]
let s:base0   = ['#808080', 244]
let s:base1   = ['#969696', 247]
let s:base2   = ['#a8a8a8', 248]
let s:base3   = ['#bbbbbb', 252]

let s:yellow  = ['#ffcc66', 180]
let s:red     = ['#f2777a', 203]
let s:green   = ['#99cc99', 119]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [[s:base023, s:base0], [s:base3, s:base01]]
let s:p.normal.middle   = [[s:base2, s:base02]]
let s:p.normal.right    = [[s:base02, s:base0], [s:base1, s:base01]]
let s:p.normal.error    = [[s:base03, s:red]]
let s:p.normal.warning  = [[s:base023, s:yellow]]

let s:p.inactive.right  = [[s:base023, s:base01], [s:base00, s:base02]]
let s:p.inactive.middle = [[s:base1, s:base023]]
let s:p.inactive.left   = [[s:base1, s:base02], [s:base00, s:base023]]

let s:p.insert.left     = [[s:base02, s:green], [s:base3, s:base01]]

let s:p.replace.left    = [[s:base023, s:red], [s:base3, s:base01]]

let s:p.visual.left     = [[s:base02, s:yellow], [s:base3, s:base01]]

let s:p.tabline.left    = [[s:base3, s:base00]]
let s:p.tabline.tabsel  = [[s:base3, s:base03]]
let s:p.tabline.middle  = [[s:base2, s:base02]]
let s:p.tabline.right   = [[s:base2, s:base00]]

let g:lightline#colorscheme#inkygrey#palette = lightline#colorscheme#flatten(s:p)
