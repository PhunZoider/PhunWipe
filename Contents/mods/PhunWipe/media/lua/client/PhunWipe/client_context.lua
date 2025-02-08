if isServer() then
    return
end

local PW = PhunWipe

function PW:showContext(playerObj, context, worldobjects)

    if isAdmin() then
        context:addOption("PhunMap: Wipe My Map", worldobjects, function()
            local p = player and getSpecificPlayer(playerObj) or getPlayer()
            PW:wipeMap(p)
        end)
    end

end
