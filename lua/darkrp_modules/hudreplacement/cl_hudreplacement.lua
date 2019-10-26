--[[---------------------------------------------------------------------------
Which default HUD elements should be hidden?
---------------------------------------------------------------------------]]

local hideHUDElements = {
    -- if you DarkRP_HUD this to true, ALL of DarkRP's HUD will be disabled. That is the health bar and stuff,
    -- but also the agenda, the voice chat icons, lockdown text, player arrested text and the names above players' heads
    ["DarkRP_HUD"] = false,

    -- DarkRP_EntityDisplay is the text that is drawn above a player when you look at them.
    -- This also draws the information on doors and vehicles
    ["DarkRP_EntityDisplay"] = false,

    -- This is the one you're most likely to replace first
    -- DarkRP_LocalPlayerHUD is the default HUD you see on the bottom left of the screen
    -- It shows your health, job, salary and wallet, but NOT hunger (if you have hungermod enabled)
    ["DarkRP_LocalPlayerHUD"] = false,

    -- If you have hungermod enabled, you will see a hunger bar in the DarkRP_LocalPlayerHUD
    -- This does not get disabled with DarkRP_LocalPlayerHUD so you will need to disable DarkRP_Hungermod too
    ["DarkRP_Hungermod"] = false,

    -- Drawing the DarkRP agenda
    ["DarkRP_Agenda"] = false,

    -- Lockdown info on the HUD
    ["DarkRP_LockdownHUD"] = false,

    -- Arrested HUD
    ["DarkRP_ArrestedHUD"] = false,

    -- Chat receivers box when you open chat or speak over the microphone
    ["DarkRP_ChatReceivers"] = false,
}

-- this is the code that actually disables the drawing.
hook.Add("HUDShouldDraw", "HideDefaultDarkRPHud", function(name)
    if hideHUDElements[name] then return false end
end)

if true then return end -- REMOVE THIS LINE TO ENABLE THE CUSTOM HUD BELOW

--[[---------------------------------------------------------------------------
The Custom HUD
only draws health
---------------------------------------------------------------------------]]
local Health = 0
local function hudPaint()
    local x, y = 30, ScrH() - 20
    local localplayer = LocalPlayer()
    Health = math.min(100, (Health == localplayer:Health() and Health) or Lerp(0.1, Health, localplayer:Health()))

    local DrawHealth = math.Min(Health / GAMEMODE.Config.startinghealth, 1)
    local Border = math.Min(6, math.pow(2, math.Round(3 * DrawHealth)))
    draw.RoundedBox(Border, x + 4, y - 30, 200 - 8, 20, Color(0,0,0,200))
    draw.RoundedBox(Border, x + 5, y - 29, (200 - 9) * DrawHealth, 18, Color(140,0,0,180))

    draw.DrawText(math.Max(0, math.Round(localplayer:Health())), "DarkRPHUD2", x + 4 + (200 - 8) / 2, y - 32, Color(255, 255, 255, 200), 1)

    -- Armor
    local armor = localplayer:Armor()
    if armor ~= 0 then
        draw.RoundedBox(2, x + 4, y - 15, (200 - 8) * armor / 100, 5, Color(0, 0, 255, 255))
    end
end
hook.Add("HUDPaint", "DarkRP_Mod_HUDPaint", hudPaint)
