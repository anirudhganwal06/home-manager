function EscapeText()
	return vim.fn.escape(vim.fn.getreg('"'), "\\/\"'")
end
