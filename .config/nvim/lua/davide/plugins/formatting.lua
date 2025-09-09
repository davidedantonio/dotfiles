return {
  "stevearc/conform.nvim",
  -- assicura che il plugin sia caricato prima del salvataggio
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local util = require("conform.util")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },

      -- usa l'automazione integrata ma aggiungiamo anche l'autocmd manuale sotto
      format_on_save = {
        lsp_fallback = true, -- <-- importante!
        async = false,
        timeout_ms = 4000,
      },

      formatters = {
        prettier = {
          -- usa il bin locale del progetto
          prefer_local = "node_modules/.bin",
          -- risolvi la root del progetto anche quando il buffer è in src/
          cwd = util.root_file({
            "package.json",
            "pnpm-workspace.yaml",
            "yarn.lock",
            "pnpm-lock.yaml",
            "bun.lockb",
            ".git",
            "eslint.config.js",
            ".eslintrc.cjs",
            ".prettierrc",
          }),
        },
      },

      notify_on_error = true,
    })

    -- Autocmd manuale (belt & suspenders): chiama SEMPRE conform prima di salvare
    -- Limita ai file dove hai definito un formatter, così non sporca altri ft.
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true }),
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local has = conform.formatters_by_ft[ft]
        if has then
          conform.format({ bufnr = args.buf, lsp_fallback = true, timeout_ms = 4000 })
        end
      end,
    })

    -- Shortcut manuale
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({ lsp_fallback = true, async = false, timeout_ms = 4000 })
    end, { desc = "Format file or range (Conform)" })
  end,
}
