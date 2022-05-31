hook.Add("player_spawn", "SetHealthMayor", function(ply)
	if ply:Team() == TEAM_MAYOR then
		ply:SetHealth(200)
		ply:SetMaxHealth(200)
		ply:SetArmor(200)
		ply:SetMaxArmor(200)
	end
end)

hook.Add("PlayerDeath", "DarkRP_Mayor_AutoDemote", function(ply, wep, killer)
    if ply:Team() == TEAM_MAYOR then
        if killer:Nick() then
            ply:changeTeam(TEAM_CITIZEN, true)
            ply:SetMaxArmor(100)
            ply:SetMaxHealth(100)
        end
        DarkRP.notifyAll(v, 4, killer:Nick() and "El Alcalde ha sido asesinado." or "El Alcalde se suicidó.")
    end
end)