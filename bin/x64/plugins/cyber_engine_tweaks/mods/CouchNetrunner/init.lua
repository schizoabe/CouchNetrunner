CouchNetrunner = {}

function CouchNetrunner:new()
    registerForEvent("onInit", function()
        local CHS = GetMod("CustomHackingSystem")

        if CHS == nil then
            print("[CouchNetrunner] Error: CustomHackingSystem mod not found")
            return
        end

        local malfunctionIcon = CHS.API.CreateUIIcon("multitool1",
            "base\\gameplay\\gui\\widgets\\mappins\\atlas_gameplay_loop_solid.inkatlas")

        local channelSurfUI   = CHS.API.CreateInteractionUI("ChannelSurf", LocKey(3610001), LocKey(3610002),
            malfunctionIcon)
        local crankItUpUI     = CHS.API.CreateInteractionUI("CrankItUp", LocKey(3610003), LocKey(3610004),
            malfunctionIcon)
        local turnItDownUI    = CHS.API.CreateInteractionUI("TurnItDown", LocKey(3610005), LocKey(3610006),
            malfunctionIcon)

        local surfCost        = CHS.API.CreateQuickhackMemoryStatModifier("ChannelSurf", "BaseCost", "Additive", 1.0)
        local crankCost       = CHS.API.CreateQuickhackMemoryStatModifier("CrankItUp", "BaseCost", "Additive", 1.0)
        local turnCost        = CHS.API.CreateQuickhackMemoryStatModifier("TurnItDown", "BaseCost", "Additive", 1.0)


        CHS.API.CreateQuickhack("ChannelSurf", "", channelSurfUI, surfCost, 0.0, 0.5)
        TweakDB:SetFlat("DeviceAction.ChannelSurf.instigatorPrereqs", {})

        CHS.API.CreateQuickhack("CrankItUp", "", crankItUpUI, crankCost, 0.0, 0.3)
        TweakDB:SetFlat("DeviceAction.CrankItUp.instigatorPrereqs", {})

        CHS.API.CreateQuickhack("TurnItDown", "", turnItDownUI, turnCost, 0.0, 0.3)
        TweakDB:SetFlat("DeviceAction.TurnItDown.instigatorPrereqs", {})
    end)

    return CouchNetrunner
end

return CouchNetrunner:new()
