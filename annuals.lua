 


morecrops.register_annual = function(opts) 
	
	local name = opts.name
	local desc = opts.description
	local foodvalue = opts.foodvalue
	local stagecnt = opts.stages
	local seed_1 = opts.seedchance[0]
	local seed_2 = opts.seedchance[1]
	local fruit_1 = opts.fruitchance[0]
	local fruit_2 = opts.fruitchance[1]
	local maxdrops = opts.maxdrops
	
	-- seeds
	minetest.register_craftitem("morecrops:"..name.."_seed", {
		description = desc.." Seeds",
		inventory_image = "morecrops_"..name.."_seed.png",
		on_place = function(itemstack, placer, pointed_thing)
			local above = minetest.env:get_node(pointed_thing.above)
			if above.name == "air" then
				above.name = "morecrops:"..name.."_1"
				minetest.env:set_node(pointed_thing.above, above)
				itemstack:take_item(1)
				return itemstack
			end
		end
	})
	
	-- produce
	minetest.register_craftitem("morecrops:"..name.."_item", {
		description = desc,
		inventory_image = "morecrops_"..name.."_item.png",
		
		on_use = minetest.item_eat(foodvalue),
	})
	
	-- ripe plant
	minetest.register_node("morecrops:"..name, {
		paramtype = "light",
		walkable = false,
		drawtype = "plantlike",
		drop = "",
		tiles = {"morecrops_"..name..".png"},
		selection_box = {
			type = "fixed",
			fixed = {
				-- need to fix nodebox adjusting
				{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
			},
		},	
		drop = {
			max_items = maxdrops,
			items = {
				{ items = {'morecrops:'..name..'_seed'} },
				{ items = {'morecrops:'..name..'_seed'}, rarity = seed_1},
				{ items = {'morecrops:'..name..'_seed'}, rarity = seed_2},
				{ items = {'morecrops:'..name..'_item'} },
				{ items = {'morecrops:'..name..'_item'}, rarity = fruit_1 },
				{ items = {'morecrops:'..name..'_item'}, rarity = fruit_2 }
			}
		},
		groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,ripeplant=1 },
		sounds = default.node_sound_leaves_defaults(),
	})
	
	-- growth stages
	for lvl = 1, stagecnt, 1 do
		minetest.register_node("morecrops:rhubarb_"..stagecnt, {
			paramtype = "light",
			walkable = false,
			drawtype = "plantlike",
			drop = "",
			tiles = {"morecrops_"..name.."_"..stagecnt..".png"},
			selection_box = {
				type = "fixed",
				fixed = {
					-- need to fix nodebox adjusting
					{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
				},
			},
			groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growingcrop=1 },
			sounds = default.node_sound_leaves_defaults(),
		})
	end
	
end




