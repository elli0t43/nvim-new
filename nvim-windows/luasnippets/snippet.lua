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

ls.add_snippets("all", {
    s("cbd", {
        t({"```"}),
        i(1),
        t({""}),
        t("```"),
        i(2),
    }),

    s("cb", {
        t({"`"}),
        i(1),
        t({"`"}),
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
        t({"#taking input", ""}),
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
        t({"#taking input", ""}),
        t({"echo \"enter the first value\"", ""}),
        t({"read var1", "", ""}),
        t({"echo \"enter the second value\"", ""}),
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

ls.add_snippets("yaml", {
    s("redgem", {
        t({"- '鵼 &aᴇᴍᴘᴛʏ ʀᴇᴅ ɢᴇᴍ sᴏᴄᴋᴇᴛ'", ""}),
        i(1),
    }),

    s("bluegem", {
        t({"- '鵼 &aᴇᴍᴘᴛʏ ʙʟᴜᴇ ɢᴇᴍ sᴏᴄᴋᴇᴛ'", ""}),
        i(1),
    }),

    s("greengem", {
        t({"- '鵼 &aᴇᴍᴘᴛʏ ɢʀᴇᴇɴ ɢᴇᴍ sᴏᴄᴋᴇᴛ'", ""}),
        i(1),
    }),

    s("blackgem", {
        t({"'鵼 &aᴇᴍᴘᴛʏ ʙʟᴀᴄᴋ ɢᴇᴍ sᴏᴄᴋᴇᴛ'", ""}),
        i(1),
    }),

    s("ctier", {
        t({"- '噾 ᴛɪᴇʀ: %img_common%'", ""}),
        i(1),
    }),

    s("uctier", {
        t({"- '噾 ᴛɪᴇʀ: %img_uncommon%'", ""}),
        i(1),
    }),

    s("rtier", {
        t({"- '噾 ᴛɪᴇʀ: %img_rare%'", ""}),
        i(1),
    }),

    s("etier", {
        t({"- '噾 ᴛɪᴇʀ: %img_epic%'", ""}),
        i(1),
    }),

    s("ltier", {
        t({"- '噾 ᴛɪᴇʀ: %img_legendary%'", ""}),
        i(1),
    }),

    s("mtier", {
        t({"- '噾 ᴛɪᴇʀ: %img_mythic%'", ""}),
        i(1),
    }),

    s("rltier", {
        t({"- '噾 ᴛɪᴇʀ: %img_common%'", ""}),
        i(1),
    }),

    s("mgive", {
        t({"mi give "}),
        i(1),
        t({"%player% 1"}),
    }),

    s("cwon", {
        t({"'&f● %img_common% &fᴀʀᴍᴏʀ ᴄʀᴀᴛᴇ &f●&8 ➡ &7you just won a "}),
        i(1),
        t({"'"}),
    }),

    s("blackhole2", {
        t({"- '&7⏵&8&l&nʙʟᴀᴄᴋ ʜᴏʟᴇ &8[&eɪɪ&8]'", ""}),
        t({"- '&fcasts a black hole which'", ""}),
        t({"- '&fattracts nearby units'", ""}),
    }),

    s("blackhole4", {
        t({"- '&7⏵&8&l&nʙʟᴀᴄᴋ ʜᴏʟᴇ &8[&eɪᴠ&8]'", ""}),
        t({"- '&fcasts a black hole which'", ""}),
        t({"- '&fattracts nearby units'", ""}),
    }),

    s("evade2", {
        t({"- '&7⏵&b&l&nᴇᴠᴀᴅᴇ &8[&eɪɪ&8]'", ""}),
        t({"- '&fyou become immune to damage '", ""}), 
        t({"- '&ftill you attack again/end of duration'", ""}),
    }),

    s("evade4", {
        t({"- '&7⏵&b&l&nᴇᴠᴀᴅᴇ &8[&eɪᴠ&8]'", ""}),
        t({"- '&fyou become immune to damage '", ""}), 
        t({"- '&ftill you attack again/end of duration'", ""}),
    }),

    s("heal2", {
        t({"- '&7⏵&a&l&nʜᴇᴀʟ &8[&eɪɪ&8]'", ""}),
        t({"- '&frestores some health.'", ""}),
    }),

    s("heal4", {
        t({"- '&7⏵&a&l&nʜᴇᴀʟ &8[&aɪᴠ&8]'", ""}),
        t({"- '&frestores some health.'", ""}),
    }),
    s("confuse2", {
        t({"- '&7⏵&e&l&nᴄᴏɴғᴜsᴇ &8[&eɪɪ&8]'", ""}),
        t({"- '&fturns your opponents camera by 90°'", ""}),
    }),

    s("confuse4", {
        t({"- '&7⏵&e&l&nᴄᴏɴғᴜsᴇ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fturns your opponents camera by 90°'", ""}),
    }),

    s("blink2", {
        t({"- '&7⏵&b&l&nʙʟɪɴᴋ &8[&eɪɪ&8]'", ""}),
        t({"- '&fteleports you to target'", ""}),
        t({"- '&flocation in the blink of an eye'", ""}),
    }),

    s("blink4", {
        t({"- '&7⏵&b&l&nʙʟɪɴᴋ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fteleports you to target'", ""}),
        t({"- '&flocation in the blink of an eye'", ""}),

    }),

    s("bunnymode2", {
        t({"- '&7⏵&a&l&nʙᴜɴɴʏ ᴍᴏᴅᴇ &8[&eɪɪ&8]'", ""}),
        t({"- '&fyou bounce on ground'", ""}),
    }),

    s("bunnymode4", {
        t({"- '&7⏵&a&l&nʙᴜɴɴʏ ᴍᴏᴅᴇ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fyou bounce on ground'", ""}),
    }),

    s("bloodbath2" ,{
        t({"- '&7⏵&c&l&nʙʟᴏᴏᴅʙᴀᴛʜ &8[&eɪɪ&8]'", ""}),
        t({"- '&ftakes food points from the target'", ""}),
    }),

    s("bloodbath4", {
        t({"- '&7⏵&c&l&nʙʟᴏᴏᴅʙᴀᴛʜ &8[&aɪᴠ&8]'", ""}),
        t({"- '&ftakes food points from the target'", ""}),
    }),

    s("burn2", {
        t({"- '&7⏵&6&l&nʙᴜʀɴ &8[&eɪɪ&8]'", ""}),
        t({"- '&fburns the target for a few secs.'", ""}),
    }),

    s("burn4", {
        t({"- '&7⏵&6&l&nʙᴜʀɴ &8[&eɪᴠ&8]'", ""}),
        t({"- '&fburns the target for a few secs.'", ""}),
    }),
    
    s("blind2", {
        t({"- '&7⏵&8&l&nʙʟɪɴᴅ &8[&eɪɪ&8]'", ""}),
        t({"- '&fblinds your opponent'", ""}),
    }),

    s("blind4", {
        t({"- '&7⏵&8&l&nʙʟɪɴᴅ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fblinds your opponent'", ""}),
    }),

    s("control2", {
        t({"- '&7⏵&9&l&nᴄᴏɴᴛʀᴏʟ &8[&eɪɪ&8]'", ""}),
        t({"- '&fslows the target.'", ""}),
        t({"- '&fwhen left clicking, knocks them'", ""}),
        t({"- '&fback in target direction.'", ""}),
    }),

    s("control4" ,{
        t({"- '&7⏵&9&l&nᴄᴏɴᴛʀᴏʟ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fslows the target.'", ""}),
        t({"- '&fwhen left clicking, knocks them'", ""}),
        t({"- '&fback in target direction.'", ""}),
    }),

    s("stun2", {
        t({"- '&7⏵&3&l&nsᴛᴜɴ &8[&eɪɪ&8]'", ""}),
        t({"- '&fmakes your opponent unable to move.'", ""}),
    }),

    s("stun4", {
        t({"- '&7⏵&3&l&nsᴛᴜɴ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fmakes your opponent unable to move.'", ""}),
    }),

    s("tacticalgrenade2", {
        t({"- '&7⏵&2&l&nᴛᴀᴄᴛɪᴄᴀʟ ɢʀᴇɴᴀᴅᴇ &8[&eɪɪ&8]'", ""}),
        t({"- '&fcasts a wave of land strikes'", ""}),
        t({"- '&fwhich eventually hits your target'", ""}),
    }),

    s("tacticalgrenade4", {
        t({"- '&7⏵&2&l&nᴛᴀᴄᴛɪᴄᴀʟ ɢʀᴇɴᴀᴅᴇ &8[&aɪᴠ&8]'", ""}),
        t({"- '&fcasts a wave of land strikes'", ""}),
        t({"- '&fwhich eventually hits your target'", ""}),
    }),

    s("absorbption2", {
        t({"- 'ऄ &7ᴀʙsᴏʀᴘᴛɪᴏɴ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("absorbption4", {
        t({"- 'ऄ &7ᴀʙsᴏʀᴘᴛɪᴏɴ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("conduit2", {
        t({"- 'अ &7ᴄᴏɴᴅᴜɪᴛ ᴘᴏᴡᴇʀ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("conduit4", {
        t({"- 'अ &7ᴄᴏɴᴅᴜɪᴛ ᴘᴏᴡᴇʀ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("damageres2", {
        t({"- 'ए &7ʀᴇsɪsᴛᴀɴᴄᴇ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("damageres4", {
        t({"- 'ए &7ʀᴇsɪsᴛᴀɴᴄᴇ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("grace2", {
        t({"- 'आ &7ᴅᴏʟᴘʜɪɴs ɢʀᴀᴄᴇ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("grace4", {
        t({"- 'आ &7ᴅᴏʟᴘʜɪɴs ɢʀᴀᴄᴇ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("fastdig2", {
        t({"- 'ई &7ʜᴀsᴛᴇ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("fastdig4", {
        t({"- 'ई &7ʜᴀsᴛᴇ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("fireres2", {
        t({"- 'इ &7ғɪʀᴇ ʀᴇsɪsᴛᴀɴᴄᴇ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("fireres4", {
        t({"- 'इ &7ғɪʀᴇ ʀᴇsɪsᴛᴀɴᴄᴇ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("healthboost2", {
        t({"- 'उ &7ʜᴇᴀʟᴛʜ ʙᴏᴏsᴛ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("healthboost4", {
        t({"- 'उ &7ʜᴇᴀʟᴛʜ ʙᴏᴏsᴛ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("herovillage2", {
        t({"- 'ऊ &7ʜᴇʀᴏ ᴏғ ᴛʜᴇ ᴠɪʟʟᴀɢᴇ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("herovillage4", {
        t({"- 'ऊ &7ʜᴇʀᴏ ᴏғ ᴛʜᴇ ᴠɪʟʟᴀɢᴇ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("increasedmg2", {
        t({"- 'ओ &7sᴛʀᴇɴɢᴛʜ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("increasedmg4", {
        t({"- 'ओ &7sᴛʀᴇɴɢᴛʜ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("invis2", {
        t({"- 'ऍ &7ɪɴᴠɪsɪʙɪʟɪᴛʏ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("invis4", {
        t({"- 'ऍ &7ɪɴᴠɪsɪʙɪʟɪᴛʏ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("jump2", {
        t({"- 'ऋ &7ᴊᴜᴍᴘ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("jump4", {
        t({"- 'ऋ &7ᴊᴜᴍᴘ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("luck2", {
        t({"- 'ऌ &7ʟᴜᴄᴋ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("luck4", {
        t({"- 'ऌ &7ʟᴜᴄᴋ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("nightvis2", {
        t({"- 'ऍ &7ɴɪɢʜᴛ ᴠɪsɪᴏɴ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("nightvis4", {
        t({"- 'ऍ &7ɴɪɢʜᴛ ᴠɪsɪᴏɴ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("regen2", {
        t({"- 'ऎ &7ʀᴇɢᴇɴᴇʀᴀᴛɪᴏɴ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("regen4", {
        t({"- 'ऎ &7ʀᴇɢᴇɴᴇʀᴀᴛɪᴏɴ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("saturation2", {
        t({"- 'ऐ &7sᴀᴛᴜʀᴀᴛɪᴏɴ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("saturation4", {
        t({"- 'ऐ &7sᴀᴛᴜʀᴀᴛɪᴏɴ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("slowfall2", {
        t({"- 'ऑ &7sʟᴏᴡ ғᴀʟʟɪɴɢ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("slowfall4", {
        t({"- 'ऑ &7sʟᴏᴡ ғᴀʟʟɪɴɢ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("speed2", {
        t({"- 'ऒ &7sᴘᴇᴇᴅ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("speed4", {
        t({"- 'ऒ &7sᴘᴇᴇᴅ:&f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("waterbreath2", {
        t({"- 'औ &7ᴡᴀᴛᴇʀ ʙʀᴇᴀᴛʜɪɴɢ: &f1 &8[&eɪɪ&8]'", ""}),
    }),

    s("waterbreath4", {
        t({"- 'औ &7ᴡᴀᴛᴇʀ ʙʀᴇᴀᴛʜɪɴɢ: &f2 &8[&aɪᴠ&8]'", ""}),
    }),

    s("roll1", {
        t({"- '&7? Rare Random Perk: I'", ""}),
    }),

    s("roll2", {
        t({"- '&7? Rare Random Perk: II'", ""}),
    }),

    s("roll3", {
        t({"- '&7? Rare Random Perk: III'", ""}),
    }),

    s("roll4", {
        t({"- '&7? Rare Random Perk: IV'", ""}),
    }),

    s("roll5", {
        t({"- '&7? Rare Random Perk: V'", ""}),
    }),

    s("roll6", {
        t({"- '&7? Rare Random Perk: VI'", ""}),
    }),

    s("roll7", {
        t({"- '&7? Rare Random Perk: VII'", ""}),
    }),

    s("roll8", {
        t({"- '&7? Rare Random Perk: VIII'", ""}),
    }),
})
