return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/files/orgfiles/**/*',
      org_default_notes_file = '~/files/orgfiles/refile.org',
    })
  end,
}
