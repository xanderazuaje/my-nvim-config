vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

--check if git repository exists
local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
if git_dir ~= "" then
  vim.cmd[[
    tabnew | Git
    only
    tabfirst
  ]]
end
