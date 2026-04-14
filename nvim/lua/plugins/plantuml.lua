return {
  'https://gitlab.com/itaranto/plantuml.nvim',
  version = '*',
  -- config = function() require('plantuml').setup() end,
  opts = {
    renderer = {
      type = 'image',
      options = {
        prog = 'feh',
        dark_mode = true,
        format = 'png', -- Allowed values: nil, 'png', 'svg'.
      }
    },
    render_on_write = true,
  }
}
