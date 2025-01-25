return {
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = 1,
      message_template = " <summary> • <date> • <author>",
      date_format = "%r",
      virtual_text_column = 1,
    },
  }
}
