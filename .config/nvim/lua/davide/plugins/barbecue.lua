return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  config = function()
    require("barbecue").setup({
      attach_navic = true, -- usa nvim-navic per i simboli
      show_navic = true,
    })
  end,
}
