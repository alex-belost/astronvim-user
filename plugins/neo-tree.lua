return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Neotree",
  init = function() vim.g.neo_tree_remove_legacy_commands = true end,
  opts = function()
    local get_icon = require("astronvim.utils").get_icon

    return {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = get_icon "FolderClosed" .. " File" },
          { source = "buffers", display_name = get_icon "DefaultFile" .. " Bufs" },
          { source = "git_status", display_name = get_icon "Git" .. " Git" },
          { source = "diagnostics", display_name = get_icon "Diagnostic" .. " Diagnostic" },
        },
      },
      default_component_configs = {
        indent = { padding = 0, indent_size = 1 },
        icon = {
          folder_closed = get_icon "FolderClosed",
          folder_open = get_icon "FolderOpen",
          folder_empty = get_icon "FolderEmpty",
          default = get_icon "DefaultFile",
        },
        modified = { symbol = get_icon "FileModified" },
        git_status = {
          symbols = {
            added = get_icon "GitAdd",
            deleted = get_icon "GitDelete",
            modified = get_icon "GitChange",
            renamed = get_icon "GitRenamed",
            untracked = get_icon "GitUntracked",
            ignored = get_icon "GitIgnored",
            unstaged = get_icon "GitUnstaged",
            staged = get_icon "GitStaged",
            conflict = get_icon "GitConflict",
          },
        },
      },
      commands = {
        system_open = function(state) require("astronvim.utils").system_open(state.tree:get_node():get_id()) end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
        copy_selector = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            e = { val = modify(filename, ":e"), msg = "Extension only" },
            f = { val = filename, msg = "Filename" },
            F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
            h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
            p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
            P = { val = filepath, msg = "Absolute path" },
          }

          local messages = {
            { "\nChoose to copy to clipboard:\n", "Normal" },
          }
          for i, result in pairs(results) do
            if result.val and result.val ~= "" then
              vim.list_extend(messages, {
                { ("%s."):format(i), "Identifier" },
                { (" %s: "):format(result.msg) },
                { result.val, "String" },
                { "\n" },
              })
            end
          end
          vim.api.nvim_echo(messages, false, {})
          local result = results[vim.fn.getcharstr()]
          if result and result.val and result.val ~= "" then
            vim.notify("Copied: " .. result.val)
            vim.fn.setreg("+", result.val)
          end
        end,
      },
      window = {
        width = 40,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["<2-LeftMouse>"] = false,
          ["H"] = false,
          ["<S-Tab>"] = "prev_source",
          ["<Tab>"] = "next_source",
          ["o"] = "open",
          ["O"] = "system_open",
          ["h"] = "parent_or_close",
          ["l"] = "child_or_open",
          ["Y"] = "copy_selector",
          ["z"] = "close_all_subnodes",
          ["Z"] = "close_all_nodes",
          ["<bs>"] = "close_node",
          ["y"] = "copy_to_clipboard",
          ["?"] = "show_help",
        },
      },
      filesystem = {
        follow_current_file = false,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["gh"] = "toggle_hidden",
            ["-"] = "navigate_up",
            ["."] = "set_root",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
        },
        components = {
          harpoon_index = function(config, node)
            local Marked = require "harpoon.mark"
            local path = node:get_id()
            local succuss, index = pcall(Marked.get_index_of, path)
            if succuss and index and index > 0 then
              return {
                text = string.format(" ⥤  %d ", index),
                highlight = config.highlight or "NeoTreeDirectoryIcon",
              }
            else
              return {}
            end
          end,
        },
        renderers = {
          file = {
            { "indent" },
            { "icon" },
            { "name", use_git_status_colors = true },
            {
              "symlink_target",
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "harpoon_index" },
            { "clipboard" },
            { "diagnostics" },
            { "git_status", highlight = "NeoTreeDimText" },
          },
        },
      },
      buffers = {
        window = {
          mappings = {
            ["-"] = "navigate_up",
            ["."] = "set_root",
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
      },
    }
  end,
}
