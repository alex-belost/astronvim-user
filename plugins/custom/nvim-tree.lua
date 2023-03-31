local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")

local M = {}

if not has_nvim_tree then return end

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts "Info")
  vim.keymap.set("n", "<C-r>", api.tree.reload, opts "Refresh")
  --
  vim.keymap.set("n", ".", api.tree.change_root_to_node, opts "cd .")
  vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts "cd ..")

  vim.keymap.set("n", "M", api.marks.bulk.move, opts "Move Bookmarked")
  vim.keymap.set("n", "m", api.marks.toggle, opts "Toggle Bookmark")

  vim.keymap.set("n", "a", api.fs.create, opts "Create")
  vim.keymap.set("n", "d", api.fs.remove, opts "Delete")
  vim.keymap.set("n", "D", api.fs.trash, opts "Trash")
  vim.keymap.set("n", "c", api.fs.copy.node, opts "Copy")
  vim.keymap.set("n", "e", api.fs.rename_basename, opts "Rename: Basename")
  vim.keymap.set("n", "q", api.tree.close, opts "Close")
  vim.keymap.set("n", "r", api.fs.rename, opts "Rename")
  vim.keymap.set("n", "R", api.fs.rename_sub, opts "Rename: Omit Filename")
  vim.keymap.set("n", "x", api.fs.cut, opts "Cut")
  vim.keymap.set("n", "y", api.fs.copy.filename, opts "Copy Name")
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
  vim.keymap.set("n", "p", api.fs.paste, opts "Paste")
  vim.keymap.set("n", "P", api.node.navigate.parent, opts "Parent Directory")
  vim.keymap.set("n", "s", api.node.run.system, opts "Run System")
  vim.keymap.set("n", "f", api.tree.search_node, opts "Search")

  vim.keymap.set("n", "zc", api.tree.collapse_all, opts "Collapse All")
  vim.keymap.set("n", "zo", api.tree.expand_all, opts "Expand All")

  -- vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
  -- vim.keymap.set("n", "P", function()
  --   local node = api.tree.get_node_under_cursor()
  --
  --   print(node.absolute_path)
  -- end, opts "Print Node Path")

  vim.keymap.set("n", "E", api.tree.expand_all, opts "Expand All")
  vim.keymap.set("n", "F", api.live_filter.clear, opts "Clean Filter")
  vim.keymap.set("n", "f", api.live_filter.start, opts "Filter")

  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")

  vim.keymap.set("n", "[g", api.node.navigate.git.prev, opts "Prev Git")
  vim.keymap.set("n", "]g", api.node.navigate.git.next, opts "Next Git")
  vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts "Next Diagnostic")
  vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts "Prev Diagnostic")

  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<Tab>", api.node.open.preview, opts "Open Preview")
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
  vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
  -- vim.keymap.set("n", "O", api.node.open.no_window_picker, opts "Open: No Window Picker")
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")

  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts "Copy Absolute Path")
  vim.keymap.set("n", "g.", api.tree.toggle_hidden_filter, opts "Toggle Dotfiles")
  vim.keymap.set("n", "gh", api.tree.toggle_custom_filter, opts "Toggle Hidden")
  vim.keymap.set("n", "gi", api.tree.toggle_gitignore_filter, opts "Toggle Git Ignore")
  vim.keymap.set("n", "gb", api.tree.toggle_no_buffer_filter, opts "Toggle No Buffer")
  vim.keymap.set("n", "gg", api.tree.toggle_git_clean_filter, opts "Toggle Git Clean")

  vim.keymap.set("n", "L", api.node.navigate.sibling.next, opts "Next Sibling")
  vim.keymap.set("n", "H", api.node.navigate.sibling.prev, opts "Previous Sibling")
  vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
  vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
end

M.setup = function()
  nvim_tree.setup {
    on_attach = on_attach,
    sort_by = "case_sensitive",
    open_on_setup = false,
    hijack_cursor = true,
    prefer_startup_root = false,
    open_on_setup_file = false,
    sync_root_with_cwd = true,
    hijack_unnamed_buffer_when_opening = true,
    view = {
      adaptive_size = true,
      side = "left",
      centralize_selection = true,
      width = 30,
    },
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      highlight_modified = "icon",
      root_folder_label = ":~:.",
    },
    filters = {
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = false, -- Turn into false from true by default
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    actions = {
      open_file = {
        quit_on_open = false,
      },
      change_dir = {
        global = true,
        restrict_above_cwd = false,
      },
    },
    modified = {
      enable = true,
    },
  }
end

return M
