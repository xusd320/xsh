return {
  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>",            desc = "LazyGit" },
      { "<leader>gG", "<cmd>LazyGitConfig<cr>",      desc = "LazyGit Config" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    },
  },

  -- DiffView
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd",  group = "Diff" },
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>",          desc = "Diffview Open" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>",         desc = "Diffview Close" },
      { "<leader>gh",  group = "Hunk/History" },
      { "<leader>ghh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>ghH", "<cmd>DiffviewFileHistory<cr>",   desc = "Project History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },

  -- Git Blame
  {
    "f-person/git-blame.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = function()
      local hl_cursor_line = vim.api.nvim_get_hl(0, { name = "CursorLine" })
      local hl_comment = vim.api.nvim_get_hl(0, { name = "Comment" })
      local hl_combined = vim.tbl_extend("force", hl_comment, { bg = hl_cursor_line.bg })
      vim.api.nvim_set_hl(0, "CursorLineBlame", hl_combined)
      return {
        highlight_group = "CursorLineBlame",
        message_template = "<summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M",
        virtual_text_column = 1,
        enabled = false, -- Default off, use toggle
      }
    end,
    keys = {
      { "<leader>gm", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame (Full)" },
    },
  },

  -- Git Conflict
  {
    "akinsho/git-conflict.nvim",
    event = { "BufRead", "BufNewFile" },
    tag = "v2.1.0",
    opts = {
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = false,
    },
    keys = {
      { "<leader>gx",  group = "Conflict" },
      { "<leader>gxo", "<cmd>GitConflictChooseOurs<cr>",   desc = "Choose Ours" },
      { "<leader>gxt", "<cmd>GitConflictChooseTheirs<cr>",  desc = "Choose Theirs" },
      { "<leader>gxb", "<cmd>GitConflictChooseBoth<cr>",    desc = "Choose Both" },
      { "<leader>gx0", "<cmd>GitConflictChooseNone<cr>",    desc = "Choose None" },
      { "]x",          "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
      { "[x",          "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Conflict" },
    },
  },

  -- Git Signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, "Next Hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, "Prev Hunk")

        -- Actions
        map("n", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>ghs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage Hunk")
        map("v", "<leader>ghr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", gs.toggle_current_line_blame, "Toggle Line Blame")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map("n", "<leader>ght", gs.toggle_deleted, "Toggle Deleted")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
      end,
    },
  },
}
