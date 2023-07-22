require("obsidian").setup({
    dir = "~/documents/00-09_privat/07_Obsidian/vault/",
    finder = "telescope.nvim",

    -- Optional, completion.
    completion = {
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir"
    },
      daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "dailies",
    -- Optional, if you want to change the date format for daily notes.
    date_format = "%d-%m-%Y"
  },

  -- Optional, for templates (see below).
  templates = {
    subdir = "templates",
    date_format = "%a-%d-%m-%Y",
    time_format = "%H:%M",
  },

})

