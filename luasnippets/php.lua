local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

local function fn(args, parent, user_args) return args[1][1] end

return {
  s("wp:group", {
    t "<?php if (have_rows('",
    i(1, "variable"),
    t { "')) : ?>", "" },
    t "  <?php while (have_rows('",
    f(fn, { 1 }),
    t { "')) : the_row(); ?>", "" },
    i(0),
    t { "", "  <?php endwhile; ?>" },
    t { "", "<?php endif; ?>" },
  }),
}
