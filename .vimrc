syntax on
let g:UltiSnipsSnippetDirectories=["UltiSnips","MySnips"]
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
autocmd bufnewfile *.c so /home/panda/vim_templates/c.txt
autocmd bufnewfile *.c exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

autocmd bufnewfile *.cpp so /home/panda/vim_templates/cpp.txt
autocmd bufnewfile *.java so /home/panda/vim_templates/java.txt

