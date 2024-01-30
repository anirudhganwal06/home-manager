function EscapeText(text)
	text = vim.fn.escape(vim.fn.escape(text, "'"), '\\/"')
	print(text)
	return text
end
