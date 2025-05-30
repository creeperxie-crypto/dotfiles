local lazy_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy/lazy.nvim")
if not vim.uv.fs_stat(lazy_dir) then
    local url = "https://github.com/folke/lazy.nvim"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", url, lazy_dir })
    assert(vim.v.shell_error == 0, "could not download lazy.nvim")
end
vim.opt.runtimepath:prepend(lazy_dir)

vim.opt.clipboard:prepend("unnamedplus")

vim.filetype.add({
    extension = {
        handlebars = "html",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "typescript", "prisma" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

require("lazy").setup({
    spec = {
        {
            "alanhamlett/neovim-wakatime",
            config = true,
        },
        { import = "plugins" },
    },
})
