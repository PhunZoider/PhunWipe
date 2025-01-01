local PW = PhunWipe

function PW:wipeMap(player)

    if self.settings.WipeMap then
        print("PhunWipeL Wiping Players Map")

        ISWorldMap.ShowWorldMap(player and player:getPlayerNum() or getPlayer())
        local wm = WorldMapVisited.getInstance()
        wm:forget()
        ISWorldMap.HideWorldMap(player and player:getPlayerNum() or getPlayer())
    end
    if self.settings.WipeSymbols then
        print("PhunWipe: Wiping Players Symbols")
        ISWorldMap.ShowWorldMap(player and player:getPlayerNum() or getPlayer())
        local count = ISWorldMap_instance.mapAPI:getSymbolsAPI():getSymbolCount() - 1
        local wm = ISWorldMap_instance
        for i = count, 1, -1 do
            wm.mapAPI:getSymbolsAPI():removeSymbolByIndex(i)
        end
        ISWorldMap.HideWorldMap(player and player:getPlayerNum() or getPlayer())

    end
    self.data[player:getUsername()] = self.settings.WipeKey
end

function PW:checkForWipe(player)
    local p = player and getSpecificPlayer(player) or getPlayer()
    local name = p:getUsername()

    print("PhunWipe: checking for wipe for " .. tostring(name) .. " testing " .. tostring(self.data[tostring(name)]) ..
              " against ", tostring(self.settings.WipeKey))

    if self.data[name] ~= self.settings.WipeKey then
        print("PhunWipe: Wipekey changed, do wipe ")
        self:wipeMap(p)
    else
        print("PhunWipe: Wipekey same, no wipe ")
    end

end

