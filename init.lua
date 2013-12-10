local modpath = minetest.get_modpath("morecrops")

morecrops = {}

dofile(modpath.."/croplist.lua")
dofile(modpath.."/annuals.lua")
dofile(modpath.."/grains.lua")


for i in ipairs(morecrops.crops) do
	
	local type = morecrops.crops[i].type
	
	
	if type == "annual" then
		morecrops.register_annual(morecrops.crops[i])
	elseif type == "grain" then
		morecrops.register_grain(morecrops.crops[i])
	end
	
	
	
	
	
end

