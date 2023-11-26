vim.api.nvim_set_keymap("n", "za", "<Cmd>call VSCodeNotify('editor.toggleFold')<CR>", {
    silent = true
})

vim.api.nvim_set_keymap("n", "zR", "<Cmd>call VSCodeNotify('editor.unfoldAll')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zM", "<Cmd>call VSCodeNotify('editor.foldAll')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zo", "<Cmd>call VSCodeNotify('editor.unfold')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "<CR>", "<Cmd>call VSCodeNotify('editor.unfold')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zO", "<Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zc", "<Cmd>call VSCodeNotify('editor.fold')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zC", "<Cmd>call VSCodeNotify('editor.foldRecursively')<CR>", {
    silent = true
})

vim.api.nvim_set_keymap("n", "z1", "<Cmd>call VSCodeNotify('editor.foldLevel1')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z2", "<Cmd>call VSCodeNotify('editor.foldLevel2')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z3", "<Cmd>call VSCodeNotify('editor.foldLevel3')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z4", "<Cmd>call VSCodeNotify('editor.foldLevel4')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z5", "<Cmd>call VSCodeNotify('editor.foldLevel5')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z6", "<Cmd>call VSCodeNotify('editor.foldLevel6')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "z7", "<Cmd>call VSCodeNotify('editor.foldLevel7')<CR>", {
    silent = true
})
vim.api.nvim_set_keymap("n", "zV", "<Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>", {
    silent = true
})
