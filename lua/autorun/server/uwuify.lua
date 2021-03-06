--[[
    f0rK (iffrizat) made this for some reason. 1/1/2021
                        UWUify
    adds a simple chat command to help uwuify text

    (If you're reading this, congrats! If you spot something weird-looking, you can always suggest a better solution or a fix at the github page)

    ⣿⣿⡆⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⣾⣿⡆⠀
⠀⠀⠀⣿⣿⡇⠀⠀⢸⣿⢰⣿⡆⠀⣾⣿⡆⠀⣾⣷ ⣿⣿⡇⠀⠀⣿⣿⡇⠀
⠀⠀⠀⣿⣿⡇⠀⠀⢸⣿⠘⣿⣿⣤⣿⣿⣿⣤⣿⡇⢻⣿⡇⠀⠀⣿⣿⡇⠀
⠀⠀⠀⣿⣿⡇⠀⠀⢸⡿⠀⢹⣿⣿⣿⣿⣿⣿⣿⠁⢸⣿⣇⠀⢀⣿⣿⠇⠀
⠀⠀⠀⠙⢿⣷⣶⣶⡿⠁⠀⠈⣿⣿⠟⠀⣿⣿⠇⠀⠈⠻⣿⣶⣾⡿⠋⠀ help
]]--

--[[

    th --> ff
    r, l --> w
    n[aeiou] --> ny[aeiou]
    ! --> ! <smily face>

    PAIN MODE:
    All of the above +
    o --> owo
    O --> Owo
    u --> uwu
    U --> Uwu

]]--

print([[
⣿⣿⡆⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⣾⣿⡆⠀
⣿⣿⡇⠀⠀⢸⣿⢰⣿⡆⠀⣾⣿⡆⠀⣾⣷ ⣿⣿⡇⠀⠀⣿⣿⡇⠀
⣿⣿⡇⠀⠀⢸⣿⠘⣿⣿⣤⣿⣿⣿⣤⣿⡇⢻⣿⡇⠀⠀⣿⣿⡇⠀
⣿⣿⡇⠀⠀⢸⡿⠀⢹⣿⣿⣿⣿⣿⣿⣿⠁⢸⣿⣇⠀⢀⣿⣿⠇⠀
⠙⢿⣷⣶⣶⡿⠁⠀⠈⣿⣿⠟⠀⣿⣿⠇⠀⠈⠻⣿⣶⣾⡿⠋ is at your service
]])

local replacement_table = {
    th="ff",  -- This is bad. --
    Th="Ff",
    tH="fF",
    TH="FF",
    r="w",
    R="W",
    l="w",
    L="W"
}

local painful_replacement_table = {
    o="owo",
    O="Owo",
    u="uwu",
    U="Uwu",
}

local smileys = {
    "(ᵘʷᵘ)",
    "(ᵘﻌᵘ)",
    "(◡ ω ◡)",
    "(◡ ꒳ ◡)",
    "(◡ w ◡)",
    "(◡ ሠ ◡)",
    "(˘ω˘)",
    "(⑅˘꒳˘)",
    "(˘ᵕ˘)",
    "(˘ሠ˘)",
    "(˘³˘)",
    "(˘ε˘)",
    "(´˘`)",
    "(´꒳`)",
    "(˘˘˘)",
    "( ᴜ ω ᴜ )",
    "( ´ω` )۶",
    "(„ᵕᴗᵕ„)",
    "(ㅅꈍ ˘ ꈍ)",
    "(⑅˘꒳˘)",
    "( ｡ᵘ ᵕ ᵘ ｡)",
    "( ᵘ ꒳ ᵘ ✼)",
    "( ˘ᴗ˘ )",
    "(ᵕᴗ ᵕ⁎)",
    "*:･ﾟ✧(ꈍᴗꈍ)✧･ﾟ:*",
    "*˚*(ꈍ ω ꈍ).₊̣̇.",
    "(。U ω U。)",
    "(U ᵕ U❁)",
    "(U ﹏ U)",
    "(◦ᵕ ˘ ᵕ◦)",
    "ღ(U꒳Uღ)",
    "♥(。U ω U。)",
    "– ̗̀ (ᵕ꒳ᵕ) ̖́-",
    "( ͡U ω ͡U )",
    "( ͡o ᵕ ͡o )",
    "( ͡o ꒳ ͡o )",
    "( ˊ.ᴗˋ )",
    "(灬´ᴗ`灬)",
    "uwu",
    "owo"
} -- thanks, https://cutekaomoji.com/characters/uwu/ --

-- Brace yourself for lots of replaces --

local function is_capital(text) return string.upper(text) == text end

local function uwuify(text) 

    for k, v in pairs(replacement_table) do
        text = string.Replace(text, k, v)
    end -- Easy replacements --

    local occurences = {}
    for v in string.gmatch(text, "[%l%d]![1!]*") do
        if !v then break end
        if table.HasValue(occurences, v) then continue end
        occurences[#occurences+1] = v
    end
    for _, v in pairs(occurences) do
        if !v then break end
        text = string.Replace(text, v, v .. " " .. smileys[ math.random( #smileys ) ])
    end -- Improved smileys after exclamation mark --

    for v in string.gmatch(text, "[Nn][aeiouAEIOU]") do
        if !v then break end
        text = string.Replace(text, v, v[1] .. (is_capital(v[2]) and "Y" or "y") .. v[2])
    end -- Better nya~ --

    return text
end

hook.Add("PlayerSay", "Uwuify", function (sender, text) 
    text = string.Trim(text) -- No more phantom spaces --

    if string.StartWith(text, "/uwu") then

        if text == "/uwu" then
            sender:ChatPrint("Usage: /uwu <text>")
            return ""
        end -- Happens when there's no input --

        text = string.Replace(text, "/uwu", "") -- Getting rid of the "/uwu" --

        return uwuify(text)

    elseif string.StartWith(text, "/painuwu") then

        if text == "/painuwu" then
            sender:ChatPrint("Usage: /painuwu <text>")
            return ""
        end -- Happens when there's no input --

        text = string.Replace(text, "/painuwu", "")
        for k, v in pairs(painful_replacement_table) do
            text = string.Replace(text, k, v)
        end

        return uwuify(text)
    end
end)