lua << EOF
dir_to_vim = {
    ["left"] = "h",
    ["right"] = "l",
    ["down"] = "j",
    ["up"] = "k"
}

function Focus(direction)
    winid = vim.fn.winnr()
    direction_winnid = vim.fn.winnr(dir_to_vim[direction])
    if (winid == direction_winnid) then
        vim.fn.system('swaymsg focus ' .. direction)
    else
        vim.api.nvim_exec("wincmd " .. dir_to_vim[direction], false)
    end
end

EOF



nnoremap <c-h> :lua Focus("left")<CR>
nnoremap <c-j> :lua Focus("down")<CR>
nnoremap <c-k> :lua Focus("up")<CR>
nnoremap <c-l> :lua Focus("right")<CR>
