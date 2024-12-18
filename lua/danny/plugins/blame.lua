return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enable = true,
    message_template = "<<sha>> • <author> • <date> • <summary>",
    date_format = "%r",
  }
}
