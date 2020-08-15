minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "chests:chest" then
		return
	end
	if not player or not fields.quit then
		return
	end
	local pn = player:get_player_name()

	if not chests.open_chests[pn] then
		return
	end

	chests.chest_lid_close(pn)
	return true
end)

minetest.register_on_leaveplayer(function(player)
	local pn = player:get_player_name()
	if chests.open_chests[pn] then
		chests.chest_lid_close(pn)
	end
end)
