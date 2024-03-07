return {
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufRead", "BufNewFile" },
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    opts = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" ⬿ %d "):format(endLnum - lnum)
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
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      return {
        fold_virt_text_handler = handler,
        open_fold_hl_timeout = 400,
        preview = {
          win_config = { border = { "", "─", "", "", "", "─", "", "" }, winblend = 0 },
          mappings = {
            scrollU = "<C-b>",
            scrollD = "<C-f>",
            jumpTop = "[",
            jumpBot = "]",
          },
        },
      }
    end,
    keys = {
      {
        "zP",
        function()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "Peek folded lines under cursor or hover",
      },
    },
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
}
