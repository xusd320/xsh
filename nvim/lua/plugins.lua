lvim.plugins = {
  {
    'projekt0n/github-nvim-theme'
  },
  {
    'lyokha/vim-xkbswitch',
  },
  {
    'catppuccin/nvim',
  },
  {
    "tpope/vim-surround",
  },
  {
    "tpope/vim-repeat"
  },
  {
    'simrat39/symbols-outline.nvim',
    event = 'BufRead',
    config = function()
      require('symbols-outline').setup { position = 'left' }
    end
  },
  {
    'j-hui/fidget.nvim',
    branch = 'legacy',
    config = function()
      require 'fidget'.setup {
        text = {
          spinner = 'dots',
        },
      }
    end
  },
  {
    'f3fora/cmp-spell',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      table.insert(lvim.builtin.cmp.sources, { name = 'spell' })
    end
  },
  {
    'mrjones2014/nvim-ts-rainbow',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()'
  },
  {
    'windwp/nvim-spectre',
    config = function()
      require('spectre').setup()
    end,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufWinEnter",
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
    ft = 'markdown',
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    config = function()
      require('todo-comments').setup()
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      lvim.lsp.on_attach_callback = function(client, bufnr)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
        client.server_capabilities.textDocument = capabilities;
      end

      require('ufo').setup({
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ('  %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, 'MoreMsg' })
          return newVirtText
        end
      })

      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
      vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
    end
  }
}