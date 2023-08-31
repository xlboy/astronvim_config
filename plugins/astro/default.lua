return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.buttons.val = {}
      opts.section.header.val = {
        "                                                     .:^!^                    ~GJ                    :PP7.                  !!.                      .J55PGB#7                                               ",
        "                     .!?JY55?:  .!~.:~!J!       7YYPGB#&@&?               :::7#@&55Y!          7!:~~!7P@@G?????7JP7        :&@5.       ..            .7PB@&5J7!!!?Y!                                         ",
        "                     ^B#@&Y?P&B!^&&B5?&@B:      !B&&&@GJ7~.              ^B#&&@###BBJ         ^&&PYJ?Y7Y&?~7G7~5#&&!     !?5&&@B: :J5GG5GG7     .PP5PP55P&#J5GJ7P&&&7                                        ",
        "                      .?@P. :&@P:#@5 JG!          .Y@#:                   ^#@&J!!.            Y@G  :5#J :  ~@J~:..:.     ?#&&&J^  :YY!.^&@?     ?@B^~5P77@5.5P~:!^::.                                        ",
        "                   :PBB&&B? ~&@Y:&@J.!!?^         .G@B?5PBBY.            :P&B~.B&5            !Y^ ?PJ^~GP: ^??~           .Y@#YPG7   :~G&!      JG~ :5GGBB77B5^                                              ",
        "                    ^?#&?!! ?@@?:&@?  .G&J   .?5PB#&&&&#BG5Y:           ~B@#~:!#&#Y5PGP:         .?77J#&BJ?!?GP?      :7YPB#&&G!~.!BB##GJ           JP&#?~B&B7                                               ",
        "                  .??5@&#BP^P&&~:&@?   Y@#.  .5###&&&@B!               Y@@&&###&&#P5YJ?:         !&@Y!!BB^^!^&@#.     :YPY7:5@57J.7@#^              ~~7B&&@P~.                                               ",
        "                  .J#@Y~:  ^&@B.:&@J!?Y&@Y      ^G@Y~P@&5~             .~~^^:.^#&G:::^^~7~:      5@B.7#5:J@G!#&B.       .Y#?5@GY?.!@#!~!JY!        .^JGBPJPB##BPYJ7!^.                                       ",
        "                   ~#7  ~^7B@&! :#@? JGY~      ~B@Y   7#@&G7:        :~!7?Y5PGB&&&######&&&~     G@P^JPPP#J :#&#:      ^B#GB&@5:   YGBBBBG5     :~?5GPJ5&G?JGG5PB##GJ!     7YJ:                              ",
        "                  .5~   Y&#PJ^  :#@7         ~P#P~     :J#@@&P?^.   :B@&&#GPYJJ#&G^^:::::~^.     B@P  ~GP?  :#&#:     ?&5: .~5&@BY7~^:.        .~^: :B@#J!~7&&^  ..       .P&&P                              ",
        "                         :.     :&#^       ^YP?:         :?P#@@&BJ^  :~^:.    .#@5               Y@#YG&GPPGJ!&@B.    75~      :7P#@@&#BG5Y?7~:.    :5#5^  .5@B.             ^5?                              ",
        "                                 G!        ::               :!7^~7!           .BP^               .P5?7!!~~~G&#B~     .           .^!?YPGB#BYYY!   7P?^ :GG#&5:             ~7~                               ",
        "                                 .                                             ^                           ^!:.                          ..      .^     ~7!:                                                 ",
        "                                                                                                                                                                                                        ",
        "                :..::^^~~!!!!!~~~?!          :.      :PG~                 ..:^~~!?J!.          755PPPPBB?              ..                            .JG5:  ^:             ~#B?       ..                ",
        "                P#GPPYYYYJJ??J?Y&@@Y        J&B!    ^#&@?       .~~.   ^5GB##BB&@GGP:         :#@GJ?~7&@G             7B#5.  ^PG!                  ~YB&BBPYG&&?     .?7!?JJ5B@&P555YYP#B7               ",
        "               :&&^  !:   .:  ~??!!~      .5@#5:   :#&&P^^7?:   ^P&#!  .?55?~7B&G:            ~&&PPG7~&@P           :P@@B7  !#@&~   .^.          ~PPJ!: :5@@BJ:     :&@BPY?77B?^~~::7BBBG:              ",
        "               ^&G. 7@#PGB&&P.         ^!:G@G?77^  P@&&BGYG@#~    ~^.     ^BB&G~              ~&&P7~.5@@7          ~#@#?.  ~&@&GYPP5G&#Y         .^^:  7B@G!.       ^&#. ^7J5P5?G&5:~:.                 ",
        "                ~. ^##JYJ7!^.         :#@&&B5JB@&7^&&?^:  J@@?    :!:    ^P&&&B?^             .B@G5PG#B7          ~&@BGJ. ^&&?5GY7^?GY?!          7#&BG&P~          ?@G. !GPY7:?&G7                     ",
        "                  :B&!  ..::^^~!~:    ~&&P:   ?@@P.J7.    J@@J ~5G&@J  .J&G~7&&@&GJ^           ^J?7!~!!!?Y?~     ^#&?J@B. !G7  J5~ :               !&@B^            .^.     ^GGP^. ..:                  ",
        "                  G@&GBBBBGGPYY&&B.   ^&&GYGB?!@&P.G&#J   Y@@Y ^7J@?  !GP~  .#@5J#@@B?:    :~7?Y5PGB#GP5Y5P?     ~~. G@J       J@#.  ^:          :5&P^. .:^^~~:       .:~!?JYB@#G####&G^                ",
        "                  7P5?!~^:::. ^&&#.   :#&&GY7.7@&P .!PY   P&@J   ~&5 ^7:    .#@Y .~J??!    5#GPGP!~&#77J~           .#@? ?5:.  !&&~ :B&Y       .J#G&GPB##&&##&&G^    ^B&&&#BGP#&B??77?7.                ",
        "                 .^!7?Y5PGGP? Y@@P     5@B..^:J@@Y       !&&&^    ?5:     ..J@@?            ^?G&B..#&GP57           :&@7 P@B:  7@@?  7@@~     ?BP~.#@&5?7~^.P&@B:     :!~:.  .B@P                       ",
        "              ^5B&&&BPJ7~:   7&@#^     :#@#####@B^  .. .7#@@J  75GBB#BGY7^7B&P?           :Y#BB##GY&B               ~&@7 .?7   5@@7  .7!    ~PY^   J@&!    ?&&B:             :#@G                       ",
        "              .~??!:    :5J?P@@G^       ^57^:557.   :GB#@#B7   ?5Y7!!?P&@&#&#PPPPPPP5Y? :YB5~  .!P&@&PYJ7!!~^:.     ^&@?    ^5P&&G.        .7:     .P@#PGB#@@@7          . .~G@&7                       ",
        "                         Y#B5?!.                     ^J!~:             :~?YPPGBBBBG5~. .!~.       :75B#&@@@@#PP5:    7!.    .?Y!^                   .JPYYJ?7!~.          !G#&#P!                        ",
        "                          .                                                                           .:^~!!:  .                                                          :!!.                          ",
      }
      return opts
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = { hint = "floating-big-letter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = { completeopt = "menu,menuone,noinsert" }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 },
      })
      return opts
    end,
  },
  { "max397574/better-escape.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
