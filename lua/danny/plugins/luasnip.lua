return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",


  config = function()
    local ls = require 'luasnip'
    local snip = ls.snippet
    local text = ls.text_node
    local insert = ls.insert_node

    ls.add_snippets('all', {
      snip('cl', {
        text 'console.log(',
        insert(1, 'message'),
        text ')',
      }),
    })

    ls.add_snippets('all', {
      snip('ct', {
        text 'color-token(',
        insert(1, ''),
        text ')',
      }),
    })

    ls.add_snippets('scss', {
      snip('beb', {
        text 'background-elevation-base',
      }),
    })

    ls.add_snippets('scss', {
      snip('sw', {
        text 'static-white',
      }),
    })

    ls.add_snippets('scss', {
      snip('sb', {
        text 'static-black',
      }),
    })

    ls.add_snippets('typescriptreact', {
      snip('cl', {
        text 'console.log(',
        insert(1, 'message'),
        text ')',
      }),
    })

    ls.add_snippets('typescript', {
      snip('cl', {
        text 'console.log(',
        insert(1, 'message'),
        text ')',
      }),
    })

    ls.add_snippets('all', {
      snip('cfg', {
        text 'colorToken="foreground-neutral-normal-on-elevation-base"',
      }),
    })

    ls.add_snippets('all', {
      snip('cfb', {
        text 'colorToken="foreground-neutral-intense-on-elevation-base"',
      }),
    })

    ls.add_snippets('all', {
      snip('cfa', {
        text 'colorToken="foreground-action-normal-on-elevation-base"',
      }),
    })

    ls.add_snippets('all', {
      snip('cfc', {
        text 'colorToken="foreground-critical-normal-on-elevation-base"',
      }),
    })

    ls.add_snippets('all', {
      snip('cfw', {
        text 'colorToken="foreground-warning-subtle-on-elevation-base"',
      }),
    })

    ls.add_snippets('all', {
      snip('tokens', {
        text { '[data-dt-mode][data-dt-theme] {', '' },
        insert(1, 'scss'),
        text { '', '}' },
      }),
    })

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/danny/my-snippets" } })
  end,

}
