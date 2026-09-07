vim.opt.guicursor = "n:block," .. "i:block-blinkwait200-blinkon200-blinkoff200"

require("davide.config.keymaps")
require("davide.config.lazy")
require("davide.config.options")
require("davide.config.highlights")
require("davide.config.autocommands")
require("davide.config.custom_functions")
require("davide.config.lsp_diagnostic")
