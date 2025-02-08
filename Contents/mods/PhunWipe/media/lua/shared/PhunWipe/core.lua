if isServer() then
    return
end
PhunWipe = {
    inied = false,
    name = "PhunWipe",
    commands = {},
    events = {},
    data = {},
    settings = {}
}

local Core = PhunWipe
Core.settings = SandboxVars[Core.name] or {}

for _, event in pairs(Core.events or {}) do
    if not Events[event] then
        LuaEventManager.AddEvent(event)
    end
end

function Core:ini()
    if not self.inied then
        self.inied = true
        self.data = ModData.getOrCreate(self.name)
    end
end

function Core:onlinePlayers(all)

    local onlinePlayers;

    if not isClient() and not isServer() and not isCoopHost() then
        onlinePlayers = ArrayList.new();
        local p = getPlayer()
        onlinePlayers:add(p);
    elseif all then
        onlinePlayers = getOnlinePlayers();

    else
        onlinePlayers = ArrayList.new();
        for i = 0, getOnlinePlayers():size() - 1 do
            local player = getOnlinePlayers():get(i);
            if player:isLocalPlayer() then
                onlinePlayers:add(player);
            end
        end
    end

    return onlinePlayers;
end
