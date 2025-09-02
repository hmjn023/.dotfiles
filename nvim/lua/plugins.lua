-- lazy.nvim プラグイン管理

return {
  { "ryanoasis/vim-devicons" },
  { "tpope/vim-commentary" },
  { "preservim/nerdtree" },
  { "EdenEast/nightfox.nvim" },
  { "neovim/nvim-lspconfig" },
  { "ray-x/lsp_signature.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "onsails/lspkind.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/vim-vsnip" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", version = "0.1.0" },
  { "nvim-telescope/telescope-frecency.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "GustavoKatel/sidebar.nvim" },
  { "goolord/alpha-nvim" },
  { "terryma/vim-multiple-cursors" },
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter" },
  { "elentok/format-on-save.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "adelarsq/image_preview.nvim" },
  { "xiyaowong/link-visitor.nvim" },
  { "mfussenegger/nvim-jdtls", lazy = true },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
