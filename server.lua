--/<#  CREDITIOS: PRIMEEZINHOO--#>/
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

coordenadas = {
  [1] = {["X"] = 360.37310, ["Y"] = -587.2090, ["Z"] = 44.0163},
  [2] = {["X"] = 349.6670, ["Y"] = -583.6174, ["Z"] = 44.0163},
  [3] = {["X"] = 326.998046, ["Y"] = -575.9862, ["Z"] = 44.021690},
  [4] = {["X"] = 344.72793, ["Y"] = -580.999, ["Z"] = 44.0163},
  [5] = {["X"] = 323.75045, ["Y"] = -575.0355, ["Z"] = 44.0216},
}

RegisterServerEvent("Primeezinho:pagar")
AddEventHandler("Primeezinho:pagar", function()
  local source = source
  local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
  if vRP.tryPayment(user_id, 500) then --- VALOR PODE SER ALTERADO ONDE SERPA COBRA DO PLAYERS PARA SE CURAR
    local escolha = math.random(1,#coordenadas)
	  vRPclient.teleport(source, coordenadas[escolha]["X"],coordenadas[escolha]["Y"],coordenadas[escolha]["Z"])
    vRPclient._playAnim(source,false,{task="WORLD_HUMAN_BUM_SLUMPED"},false)
    TriggerClientEvent("pNotify:SendNotification", player, {
      text = "Você pagou 500 reais pela Recuperação!",
    })
    SetTimeout(15000, function()
      local source = vRP. getUserSource(user_id)
      vRPclient._stopAnim(source,false)
      vRPclient.teleport(source, 302.0137,-586.050,43.29188)
      vRPclient._varyHealth(player,100) --- VALOR PODE SER ALTERADO LEMBRANDO Q ESSE VALOR E A % DE HP QUE PLAYERS IRÁ RECEBER APOS SER INTERNADO
    end)
  else
    TriggerClientEvent("pNotify:SendNotification", player, {
      text = "Você não tem dinheiro suficiente",
    })
  end
end)
--/<# CREDITOS: PRIMEEZINHOOO #>/--