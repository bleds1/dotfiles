require("obsidian").setup({
        workspaces = {
        {
          name = "personal",
          path = "~/Dropbox/vault",
        },
        },
        daily_notes = {
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y%m%d",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = 'daily-note-template.md'
       },
-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
    -- Where to put new notes created from completion. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "current_dir",
    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",
    -- Control how wiki links are completed with these (mutually exclusive) options:
    -- 1. Whether to add the note ID during completion.
    -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
    -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
    prepend_note_id = true,
    -- 2. Whether to add the note path during completion.
    -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
    -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
    prepend_note_path = false,
    -- 3. Whether to only use paths during completion.
    -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
    -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
    use_path_only = false,
      },
    disable_frontmatter = true,
 -- Optional, for templates (see below).
    templates = {
    subdir = "Archive/Templates/",
    date_format = "%Y%m%d%H%M",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
     },
    mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes "obsidian done"
    ["<leader>cb"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
  }
  },
    ui = {
    enable = true,  -- set to false to disable all additional syntax features
    update_debounce = 200,  -- update delay after a text change (in milliseconds)
    -- Define how various check-boxes are displayed
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

      -- You can also add more custom ones...
    },
    -- Use bullet marks for non-checkbox lists.
    bullets = { char = "•", hl_group = "ObsidianBullet" },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    -- Replace the above with this if you don't have a patched font:
    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    hl_groups = {
      -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
      ObsidianTodo = { bold = true, fg = "#6daad5" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianBullet = { bold = true, fg = "#6daad5" },
      ObsidianRefText = { underline = true, fg = "#c792ea" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#6daad5" },
      ObsidianHighlightText = { bg = "#75662e" },
    },
    },
  })

