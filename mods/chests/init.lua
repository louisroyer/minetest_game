-- Minetest 5 mod: chests
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

local MP = minetest.get_modpath("chests")

dofile(MP.."/api.lua")
dofile(MP.."/settings.lua")
dofile(MP.."/registrations.lua")
dofile(MP.."/chests.lua")
dofile(MP.."/aliases.lua")
dofile(MP.."/legacy.lua")
