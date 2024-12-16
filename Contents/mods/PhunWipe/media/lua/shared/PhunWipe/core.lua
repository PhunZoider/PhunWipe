if not isClient() then
    -- no server files for this mod so just leave to client
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
