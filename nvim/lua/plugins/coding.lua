return {
  {
    'hrsh7th/nvim-cmp',
    -- Dependencies for NVIM CMP
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" }
      },
      { "saadparwaiz1/cmp_luasnip" },
    },
    -- Configs for NVIM CMP
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

      return {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "friendly-snippets"},
          { name = "lazydev" }
        },
        snippet = {
          expand = function (args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users. 
          end
        },
        mapping = {
          ['<C-space>'] = cmp.mapping.confirm({ select = false }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxWidth = {
              menu = 50,
              abbr = 50,
            },
            ellipsis_char = "...",
            show_labelDetails = true,
            before = function(entry, vim_item)
              return vim_item
            end
          })
        },
      }
    end,
  },
}
