local hissit = {
    {koordit = vector3(0,0,0), koordit2 = vector3(0,0,0), paikka = "esimerkki 1"},
    -- vaiha koordit, koordit on menopaikka ja koordit2 on määränpää.. voit lisää noit enemmä ihsm mite paljo haluut
    
}

CreateThread(function()
    while true do
        Wait(3)
        local PelaajanPedi = PlayerPedId()
        local PelaajanKoordit = GetEntityCoords(PelaajanPedi)
        local Nukutuspiikki = true
        for i, h in pairs(hissit) do 
            local distancepaska = #(h.koordit - PelaajanKoordit)
            if distancepaska < 3.5 then 
                Nukutuspiikki = false
                lib.showTextUI('[E] - Mene hissistä : ' .. h.paikka)
                if IsControlJustPressed(0, 38) then
                    SetEntityCoordsNoOffset(PlayerPedId(), h.koordit2)
                end
            else 
                local distancepaska2 = #(h.koordit2 - PelaajanKoordit)
                if distancepaska2 < 3.5 then
                    Nukutuspiikki = false
                    lib.showTextUI('[E] - Mene hissistä : ' .. h.paikka)
                    if IsControlJustPressed(0, 38) then
                        SetEntityCoordsNoOffset(PlayerPedId(), h.koordit)
                    end
                else 
                    lib.hideTextUI()
                    Nukutuspiikki = true
                end
            end
        end
        if Nukutuspiikki then
            Wait(500)
        end
    end
end)