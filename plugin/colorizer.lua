-- plugin/nvim-colorizer

require 'colorizer'.setup (nil, {
	RGB      = true,         
	RRGGBB   = true,         
	RRGGBBAA = true,        
	names    = false,         
	rgb_fn   = false,        
	hsl_fn   = false,        
	css      = false,        
	css_fn   = false,        
	mode     = 'foreground' 
})
