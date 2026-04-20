local default_notebook = [[
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [""]
    }
  ],
  "metadata": {
    "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
    },
    "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
    }
  },
  "nbformat": 4,
  "nbformat_minor": 5
}
]]

local function new_notebook(filename)
	local path = filename .. ".ipynb"
	local file = io.open(path, "w")
	if file then
		file:write(default_notebook)
		file:close()
		vim.cmd("edit " .. vim.fn.fnameescape(path))
	else
		vim.notify("Error: Could not open new notebook file for writing.", vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_user_command("NewNotebook", function(opts)
	new_notebook(opts.args)
end, {
	nargs = 1,
	complete = "file",
	desc = "Create a new blank Jupyter notebook",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		local opts = { buffer = true, desc = "Jupytext cell" }
		vim.keymap.set("n", "<localleader>nm", "o```markdown<CR>```<Esc>O", opts)
		vim.keymap.set("n", "<localleader>nc", "o```python<CR>```<Esc>O", opts)
		vim.keymap.set("n", "]c", function()
			vim.cmd("normal! }")
			vim.cmd("normal! /```<CR>")
		end, opts)
		vim.keymap.set("n", "[c", function()
			vim.cmd("normal! {")
			vim.cmd("normal! ?```<CR>")
		end, opts)
	end,
})
