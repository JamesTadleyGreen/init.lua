<<<<<<< HEAD
vim.g.clipboard = {
               name= 'WslClipboard',
               copy= {
                  ["+"]= "clip.exe",
                  ["*"]= "clip.exe",
                },
               paste= {
                  ["+"]= 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                  ["*"]= 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
               },
               cache_enabled= 0,
             }
=======
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
	}
end
>>>>>>> ec6a1da11867100e795b6c5cf72a79ec0236a921
