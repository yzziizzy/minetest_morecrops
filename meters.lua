 
minetest.register_node("morecrops:thermometer", {
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"morecrops_thermometer.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	},
	groups = {cracky=1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		-- get the temperature
	end,
})

minetest.register_node("morecrops:hygrometer", {
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"morecrops_hygrometer.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	},
	groups = {cracky=1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		-- get the humidity
	end,
})