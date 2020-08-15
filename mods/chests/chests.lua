-- support for MT game translation.
local S = minetest.get_translator("chests")
local lock = minetest.get_modpath("basic_materials") and chests.settings.basic_materials and "basic_materials:padlock"
	or minetest.get_modpath("ores") and chests.settings.locked_chest and "ores:steel_ingot"
	or nil

chests.chest.register_chest("chests:chest", {
	description = S("Chest"),
	tiles = {
		"chests_chest_top.png",
		"chests_chest_top.png",
		"chests_chest_side.png",
		"chests_chest_side.png",
		"chests_chest_front.png",
		"chests_chest_inside.png"
	},
	sounds = woods.node_sound_wood_defaults(),
	sound_open = "chests_chest_open",
	sound_close = "chests_chest_close",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
})

minetest.register_craft({
	output = "chests:chest",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "chests:chest",
	burntime = 30,
})

if lock then
	chests.chest.register_chest("chests:chest_locked", {
		description = S("Locked Chest"),
		tiles = {
			"chests_chest_top.png",
			"chests_chest_top.png",
			"chests_chest_side.png",
			"chests_chest_side.png",
			"chests_chest_lock.png",
			"chests_chest_inside.png"
		},
		sounds = woods.node_sound_wood_defaults(),
		sound_open = "chests_chest_open",
		sound_close = "chests_chest_close",
		groups = {choppy = 2, oddly_breakable_by_hand = 2},
		protected = true,
	})

	minetest.register_craft({
		output = "chests:chest_locked",
		recipe = {
			{"group:wood", "group:wood", "group:wood"},
			{"group:wood", lock, "group:wood"},
			{"group:wood", "group:wood", "group:wood"},
		}
	})

	minetest.register_craft( {
		type = "shapeless",
		output = "chests:chest_locked",
		recipe = {"chests:chest", lock},
	})


	minetest.register_craft({
		type = "fuel",
		recipe = "chests:chest_locked",
		burntime = 30,
	})
end
