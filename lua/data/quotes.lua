local quote_list = {
    "How much time are you spending deciding what to spend time on?",
    "You cannot overestimate the unimportance of practically everything.",
    "Happiness is the acceptance of the journey as it is now, not the promise of the other shore.",
    "Wisdom, when spoken aloud, always sounds a little foolish. Perhaps that's because when we hear something that makes sense to us, we think we already know it. But often we don't.",
    "The price of anything is the amount of life you exchange for it.",
    "Never let your memories be bigger than your dreams.",
    "Take a simple idea and take it seriously.",
    "Be messy and complicated and afraid and show up anyways.",
    "People forget the brain lives inside the body. If the body's unhealthy, the brain's unhealthy.",
    "A man who has a vision is not able to use the power of it until after he has performed the vision on earth for the people to see.",
    "I’ve never seen any life transformation that didn’t begin with the person in question finally getting tired of their own bullshit.",
    "Life starts all over again when it gets crisp in the fall.",
    "It is not doubt but certainty that drives you mad.",
    "You take people as far as they will go, not as far as you would like them to go.",
    "A man is rich in proportion to the number of things he can afford to let alone.",
    "If I see a man with a good brain who simply won't get down and dig, who won't master fundamentals, I cannot help but pity him.",
    "Any fool can criticize, condemn and complain—and most fools do. But it takes character and self-control to be understanding and forgiving.",
    "If you do not change direction, you might end up where you are heading.",
    "There will come a time when you believe everything is finished. That will be the beginning.",
    "Do fewer things. Do them better. Know why you're doing them.",
    "Perfection is not when there is no more to add, but no more to take away.",
    "You could be good today. But instead, you choose tomorrow.",
    "A good listener is one who helps us overhear ourselves.",
}

local get_random_formatted = function (list, width)
    -- fetching the quote
    math.randomseed(os.time())
    local index = math.random(1, #quote_list)
    local unformatted = list[index]

    -- split line by spaces into list of words
    local words = {}
    local target = "%S+"
    for word in unformatted:gmatch(target) do
        table.insert(words, word)
    end

    -- meant to separate buttons and quote
    local formatted = " \n\n\n\n "
    local buffer = ""
    for i, word in ipairs(words) do
        if (#buffer + #word > width) then
            formatted = formatted .. "\n" .. buffer:sub(1, -2)
            buffer = word .. " "
        else
            buffer = buffer .. word .. " "
        end
        if (i == #words) then
            formatted = formatted .. "\n" .. buffer:sub(1, -2)
        end
    end

    return formatted
end

local main = function ()
    local max_width = 54
    return get_random_formatted(quote_list, max_width)
end

return main
