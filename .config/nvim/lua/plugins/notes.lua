return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        { path = "~/Nextcloud/Notes", name = "Notes" },
      },
    },
  },
}
