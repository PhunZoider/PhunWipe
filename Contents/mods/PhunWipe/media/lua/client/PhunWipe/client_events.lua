if isServer() then
    return
end

local PW = PhunWipe

Events.OnPreFillWorldObjectContextMenu.Add(function(playerObj, context, worldobjects)
    PW:showContext(playerObj, context, worldobjects)
end);

Events.OnPlayerDeath.Add(function(player)
    if PW.settings.WipePerCharacter then
        PW.data[player:getUsername()] = nil
    end
end)

local function setup()
    Events.OnTick.Remove(setup)
    PW:ini()
    local players = PW:onlinePlayers()
    for i = 1, players:size() do
        local p = players:get(i - 1)
        if p:isLocalPlayer() then
            PW:checkForWipe(p)
        end
    end

end

Events.OnTick.Add(setup)
