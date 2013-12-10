local modpath = minetest.get_modpath("morecrops")

morecrops = {}

dofile(modpath.."/croplist.lua")
dofile(modpath.."/annuals.lua")


for i in ipairs(morecrops.crops) do
	
	local type = morecrops.crops[i].type
	
	
	if type == "annual" then
		morecrops.register_annual(morecrops.crops[i])
	end
	
	
	
	
	
end

