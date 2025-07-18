require("dapui").setup({
  -- You can customize the UI layout or use the default configuration.
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- Width of the sidebar
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10, -- Height of the bottom panel
      position = "bottom",
    },
  },
})

