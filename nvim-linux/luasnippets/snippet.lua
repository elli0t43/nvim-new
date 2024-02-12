local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("md", {
    s("cbd", {
        t({"```"}),
        i(1),
        t({""}),
        t("```"),
        i(2),
    }),

    s("ckl", {
        t("- ["),
        i(2),
        t("] "),
        i(1),
    }),

    s("h1", {
        t("# "),
        i(1),
    }),

    s("h2", {
        t("## "),
        i(1),
    }),

    s("h3", {
        t("### "),
        i(1),
    }),

    s("h4", {
        t("#### "),
        i(1),
    }),

    s("h5", {
        t("##### "),
        i(1),
    }),

    s("h6", {
        t("###### "),
        i(1),
    }),
})

ls.add_snippets("sh", {
    s("2inp", {
        t({"#Taking input", ""}),
        t("echo \""),
        i(1),
        t({"\"", ""}),
        t("read "),
        i(2),
        t({"", ""}),
        t("echo \""),
        i(3),
        t({"\"", ""}),
        t("read "),
        i(4),
    }),

    s("2er", {
        t({"#Taking input", ""}),
        t({"echo \"Enter the first value\"", ""}),
        t({"read var1", "", ""}),
        t({"echo \"Enter the second value\"", ""}),
        t({"read var2", ""}),
        i(1),
    }),

    s("bb", {
        t({"#!/bin/bash", ""}),
        i(1),
    }),

    s("ec", {
        t({"echo \""}),
        i(1),
        t({"\"", ""}),
        i(2),
    }),
})

