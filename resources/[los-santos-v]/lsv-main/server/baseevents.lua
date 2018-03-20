local killedMessage = {
	"killed",
	"destroyed",
	"finished",
	"ended",
	"murdered",
	"wiped out",
	"executed",
	"erased",
	"whacked",
	"deaded",
	"slain",
	"atomized",
	"raped",
	"assassinated",
	"fucked up",
}

local function getKilledMessage()
	return killedMessage[math.random(Utils.GetTableLength(killedMessage))]
end


RegisterServerEvent('baseevents:onPlayerDied')
AddEventHandler('baseevents:onPlayerDied', function()
	local player = source

	Db.UpdateRP(player, -Settings.RPPerDeath, function()
		Db.UpdateDeaths(player, function()
			Scoreboard.ResetKillstreak(player)
			TriggerClientEvent('lsv:onPlayerDied', -1, player, true)
		end)
	end)
end)


RegisterServerEvent('baseevents:onPlayerKilled')
AddEventHandler('baseevents:onPlayerKilled', function(killer)
	local victim = source

	if killer ~= -1 then
		Db.UpdateKills(killer, function()
			local killerRP = Settings.RPPerKill + (Settings.RPPerKillstreak * Scoreboard.GetPlayerStats(killer).killstreak)

			Scoreboard.UpdateKillstreak(killer)

			Db.UpdateRP(killer, killerRP, function()
				TriggerClientEvent('lsv:onRPEarnedPerKill', killer, killerRP)
				TriggerClientEvent('lsv:onPlayerKilled', -1, victim, killer, getKilledMessage())
			end)
		end)
	end

	Db.UpdateRP(victim, -Settings.RPPerDeath, function()
		Db.UpdateDeaths(victim, function()
			Scoreboard.ResetKillstreak(victim)
			TriggerClientEvent('lsv:onRPLostPerDeath', victim, Settings.RPPerDeath)

			if killer ~= -1 then return end
			TriggerClientEvent('lsv:onPlayerDied', -1, victim)
		end)
	end)
end)