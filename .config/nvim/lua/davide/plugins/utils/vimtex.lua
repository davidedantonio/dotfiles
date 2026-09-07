return {
	"lervag/vimtex",
	lazy = false, -- Importante: non caricare in modo lazy per permettere l'avvio automatico sugli eventi TeX
	init = function()
		-- Scegli il tuo visualizzatore PDF: 'zathura', 'skim', 'sumatrapdf', ecc.
		vim.g.vimtex_view_method = "skim"

		-- Utilizza latexmk come motore di compilazione predefinito
		vim.g.vimtex_compiler_method = "latexmk"

		-- Nasconde la sintassi LaTeX complessa sostituendola con simboli (opzionale)
		vim.g.vimtex_syntax_conceal_disable = 1
	end,
}
