if not isClient() then
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

Events.OnCreatePlayer.Add(function(player)
    print("PhunWipe: OnCreatePlayer")
    PW:ini()
    PW:checkForWipe(player)
end)
