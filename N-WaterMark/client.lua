local watermarkText = "Your Server Name"
local jumpOffset = 0
local jumpDirection = 1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        jumpOffset = jumpOffset + 0.1 * jumpDirection
        if jumpOffset > 2 then
            jumpDirection = -1
        elseif jumpOffset < -2 then
            jumpDirection = 1
        end

        local time = GetGameTimer() / 500
        local r = math.floor((math.sin(time * 2) * 127) + 128)
        local g = math.floor((math.sin(time * 2 + 2) * 127) + 128)
        local b = math.floor((math.sin(time * 2 + 4) * 127) + 128)

        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.4, 0.4)
        SetTextColour(r, g, b, 200)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextCentre(false)
        SetTextOutline()

        SetTextEntry("STRING")
        AddTextComponentString(watermarkText)
        DrawText(0.01, 0.01 + (jumpOffset / 100))
    end
end)
