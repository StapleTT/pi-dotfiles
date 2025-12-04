return {
  -- Using Lazy
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "warm",
        transparent = true,
      })
      require("onedark").load()
    end,
  },
}
