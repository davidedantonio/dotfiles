return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest")({
          -- config opzionali: cwd, vitestCommand, ecc.
        }),
      },
    })

    local neotest = require("neotest")

    -- 🔑 Keybindings
    vim.keymap.set("n", "<leader>tt", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run tests in current file" })

    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle test summary" })

    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open({ enter = true })
    end, { desc = "Show test output" })

    vim.keymap.set("n", "<leader>tO", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle output panel" })

    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Debug nearest test" })
  end,
}
