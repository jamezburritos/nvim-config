require 'nvim-treesitter.configs'.setup {
	sync_install = false,
	auto_install = true,

	ensure_installed = { "c", "lua", "rust" },
	ignore_install = { "javascript" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
