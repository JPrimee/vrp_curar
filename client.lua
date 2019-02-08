--/<# CREDITOS: PRIMEEZINHOOO #>/--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local Hospital = { 

}

local Camas = {
	[1]  = { ["X"] = 308.4091, ["Y"] = -594.26, ["Z"] = 43.29},
}

Citizen.CreateThread(function()
	for _, item in pairs(Hospital) do
      	item.blip = AddBlipForCoord(item.x, item.y, item.z)
      	SetBlipSprite(item.blip, item.id)
      	SetBlipColour(item.blip, item.cor)
      	SetBlipAsShortRange(item.blip, true)
      	BeginTextCommandSetBlipName("STRING")
      	AddTextComponentString(item.nome)
      	EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #Camas do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, Camas[i]["X"], Camas[i]["Y"], Camas[i]["Z"], true)
			if Distancia < 30.0 then
				Opacidade = math.floor(255 - (Distancia * 7))
				Texto3D(307.777,-595.3237, 43.291,"~w~Pressione ~r~[ E ]  ~w~| Valor Para Recuperar : ~y~500 reais", Opacidade)
				DrawMarker(27,168.09,-567.21,42.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, Opacidade, 0, 0, 0, 0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		for i = 1, #Camas do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, Camas[i]["X"], Camas[i]["Y"], Camas[i]["Z"], true)
			if Distancia < 2.0 and IsControlPressed(1,38) then
				TriggerServerEvent("Primeezinho:pagar", source)
			end
		end
	end
end)

function Texto3D(x,y,z, text, Opacidade)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())    
    if onScreen then
        SetTextScale(0.54, 0.54)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, Opacidade)
        SetTextDropshadow(0, 0, 0, 0, Opacidade)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--/<# CREDITOS: PRIMEEZINHOOO #>/--