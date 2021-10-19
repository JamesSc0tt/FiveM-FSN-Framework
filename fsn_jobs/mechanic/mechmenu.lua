function moneycheck(amt)
	if amt == nil then
		 TriggerEvent('fsn_notify:displayNotification', '<b>SHIT</b> Something went wrong lol.', 'centerLeft', 3000, 'error')
		return false
	end
	local result = false

	 if tonumber(exports.fsn_main:fsn_GetWallet()) >= tonumber(amt) then
	 	return true
	 else
	  	TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
	 end
	return false
end

local lsc = {
	inside = false,
	title = "Mechanic Car Upgrades",
	currentmenu = "repair",
	lastmenu = nil,
	currentpos = nil,
	currentgarage = 0,
	selectedbutton = 0,
	locations = {
		[1] = {outside = { x = 541.64996337891, y = -187.90875244141, z = 54.068435668945, heading = 89.690490722656}, inside = { x = 541.64996337891, y = -187.90875244141, z = 54.068435668945, heading = 89.690490722656}}
    },
	menu = {
		x = 0.8,
		y = 0.1,
		width = 0.25,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		["bumpers"] = {
			title = "bumpers",
			name = "bumpers",
			buttons = {

			}
		},
		["frontbumper"] = {
			title = "frontbumper",
			name = "frontbumper",
			buttons = {

			}
		},
		["rearbumper"] = {
			title = "rearbumper",
			name = "rearbumper",
			buttons = {

			}
		},
		["main"] = {
			title = "categories",
			name = "main",
			buttons = {

			}
		},["exhaust"] = {
			title = "exhaust",
			name = "exhaust",
			buttons = {

			}
		},
		["fenders"] = {
			title = "fenders",
			name = "fenders",
			buttons = {

			}
		},
		["grille"] = {
			title = "grille",
			name = "grille",
			buttons = {

			}
		},
		["hood"] = {
			title = "hood",
			name = "hood",
			buttons = {

			}
		},["rollcage"] = {
			title = "rollcage",
			name = "rollcage",
			buttons = {

			}
		},
		["roof"] = {
			title = "roof",
			name = "roof",
			buttons = {

			}
		},
		["skirts"] = {
			title = "skirts",
			name = "skirts",
			buttons = {

			}
		}
		,
		["spoiler"] = {
			title = "spoiler",
			name = "spoiler",
			buttons = {

			}
		},["wheeliebar"] = {
			title = "wheeliebar",
			name = "wheeliebar",
			buttons = {

			}
		},
		["chassis"] = {
			title = "chassis",
			name = "chassis",
			buttons = {

			}
		}
	,["primarymetallic"] = {
			title = "primary colors",
			name = "primarymetallic",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondarymetallic"] = {
			title = "secondary colors",
			name = "secondarymetallic",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["pearlescentmetallic"] = {
			title = "pearlescent colors",
			name = "pearlescentmetallic",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},

		["primarymatte"] = {
				title = "primary colors",
				name = "primarymatte",
				buttons = {
					{name = "Black", colorindex = 12,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gray", colorindex = 13,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Light Gray", colorindex = 14,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Ice White", colorindex = 131,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Blue", colorindex = 83,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Blue", colorindex = 82,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Blue", colorindex = 84,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Purple", colorindex = 149,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Schafter Purple", colorindex = 148,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Red", colorindex = 39,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Red", colorindex = 40,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Orange", colorindex = 41,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Yellow", colorindex = 42,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Lime Green", colorindex = 55,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Green", colorindex = 128,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Frost Green", colorindex = 151,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Foliage Green", colorindex = 155,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Olive Darb", colorindex = 152,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Earth", colorindex = 153,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Desert Tan", colorindex = 154,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["secondarymatte"] = {
				title = "secondary colors",
				name = "secondarymatte",
				buttons = {
					{name = "Black", colorindex = 12,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gray", colorindex = 13,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Light Gray", colorindex = 14,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Ice White", colorindex = 131,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Blue", colorindex = 83,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Blue", colorindex = 82,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Blue", colorindex = 84,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Purple", colorindex = 149,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Schafter Purple", colorindex = 148,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Red", colorindex = 39,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Red", colorindex = 40,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Orange", colorindex = 41,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Yellow", colorindex = 42,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Lime Green", colorindex = 55,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Green", colorindex = 128,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Frost Green", colorindex = 151,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Foliage Green", colorindex = 155,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Olive Darb", colorindex = 152,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Earth", colorindex = 153,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Desert Tan", colorindex = 154,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["pearlescentmatte"] = {
				title = "pearlescent colors",
				name = "secondarymatte",
				buttons = {
					{name = "Black", colorindex = 12,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Gray", colorindex = 13,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Light Gray", colorindex = 14,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Ice White", colorindex = 131,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Blue", colorindex = 83,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Blue", colorindex = 82,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Blue", colorindex = 84,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Midnight Purple", colorindex = 149,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Schafter Purple", colorindex = 148,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Red", colorindex = 39,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Red", colorindex = 40,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Orange", colorindex = 41,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Yellow", colorindex = 42,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Lime Green", colorindex = 55,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Green", colorindex = 128,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Frost Green", colorindex = 151,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Foliage Green", colorindex = 155,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Olive Darb", colorindex = 152,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Dark Earth", colorindex = 153,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Desert Tan", colorindex = 154,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["primarymetal"] = {
				title = "primary colors",
				name = "primarymetal",
				buttons = {
					{name = "Brushed Steel",colorindex = 117,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Black Steel",colorindex = 118,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Aluminum",colorindex = 119,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Pure Gold",colorindex = 158,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Gold",colorindex = 159,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["secondarymetal"] = {
				title = "secondary colors",
				name = "secondarymetal",
				buttons = {
					{name = "Brushed Steel",colorindex = 117,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Black Steel",colorindex = 118,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Aluminum",colorindex = 119,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Pure Gold",colorindex = 158,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Gold",colorindex = 159,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["pearlescentmetal"] = {
				title = "pearlescent colors",
				name = "secondarymetal",
				buttons = {
					{name = "Brushed Steel",colorindex = 117,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Black Steel",colorindex = 118,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Aluminum",colorindex = 119,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Pure Gold",colorindex = 158,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
					{name = "Brushed Gold",colorindex = 159,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
				}
			},
			["wheelcolor"] = {
			title = "wheel colors",
			name = "wheelcolor",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["windows"] = {
			title = "windows",
			name = "windows",
			buttons = {
				{name = "None",tint = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pure Black",tint = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Darksmoke",tint = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lightsmoke",tint = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Limo",tint = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Green",tint = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheelaccessories"] = {
			title = "wheel accessories",
			name = "wheelaccessories",
			buttons = {
				{name = "Stock Tires", costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Custom Tires", costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
                -- {name = "Bulletproof Tires", costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
			}
        },
		["respray"] = {
			title = "resprays",
			name = "respray",
			buttons = {
				{name = "Primary Color", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Secondary Color", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pearlescent Color", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["primarycolor"] = {
			title = "color groups",
			name = "primarycolor",
			buttons = {
				{name = "Chrome", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Matte", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metallic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metals", description = "", centre = 0, font = 0, scale = 0.4}
			}
		}
		,
		["secondarycolor"] = {
			title = "color groups",
			name = "secondarycolor",
			buttons = {
				{name = "Chrome", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Matte", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metallic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metals", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["pearlescentcolor"] = {
			title = "color groups",
			name = "pearlescentcolor",
			buttons = {
				{name = "Chrome", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Matte", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metallic", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Metals", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["primarychrome"] = {
			title = "primary colors",
			name = "primarycolchrome",
			buttons = {
				{name = "Chrome", costs =1500,colorindex = 120, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondarychrome"] = {
			title = "secondary colors",
			name = "secondarycolchrome",
			buttons = {
				{name = "Chrome", costs =1500, colorindex = 120, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["pearlescentchrome"] = {
			title = "pearlescent colors",
			name = "pearlescentchrome",
			buttons = {
				{name = "Chrome", costs =1500,colorindex = 120, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},

		["primaryclassic"] = {
			title = "primary colors",
			name = "primaryclassic",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["secondaryclassic"] = {
			title = "secondary colors",
			name = "secondaryclassic",
			buttons = {
				{name = "Black",costs =1500, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["pearlescentclassic"] = {
			title = "pearlescent colors",
			name = "pearlescentclassic",
			buttons = {
				{name = "Black",costs = 1000, colorindex = 0, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbon Black",costs =1500, colorindex = 147, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hraphite",costs =1500, colorindex = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Anhracite Black",costs =1500, colorindex = 11, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Black Steel",costs =1500, colorindex = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Steel",costs =1500, colorindex = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Silver",costs =1500, colorindex = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bluish Silver",costs =1500, colorindex = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rolled Steel",costs =1500, colorindex = 6, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow Silver",costs =1500, colorindex = 7, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stone Silver",costs =1500, colorindex = 8, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Silver",costs =1500, colorindex = 9, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cast Iron Silver",costs =1500, colorindex = 10, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red",costs =1500, colorindex = 27, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Torino Red",costs =1500, colorindex = 28, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Formula Red",costs =1500, colorindex = 29, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lava Red",costs =1500, colorindex = 150, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blaze Red",costs =1500, colorindex = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Grace Red",costs =1500, colorindex = 31, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Garnet Red",costs =1500, colorindex = 32, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunset Red",costs =1500, colorindex = 33, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cabernet Red",costs =1500, colorindex = 34, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wine Red",costs =1500, colorindex = 143, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Candy Red",costs =1500, colorindex = 35, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink",costs =1500, colorindex = 135, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pfsiter Pink",costs =1500, colorindex = 137, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Salmon Pink",costs =1500, colorindex = 136, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise Orange",costs =1500, colorindex = 36, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange",costs =1500, colorindex = 38, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Orange",costs =1500, colorindex = 138, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gold",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bronze",costs =1500, colorindex = 90, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow",costs =1500, colorindex = 88, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Yellow",costs =1500, colorindex = 89, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dew Yellow",costs =1500, colorindex = 91, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green",costs =1500, colorindex = 49, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Green",costs =1500, colorindex = 50, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sea Green",costs =1500, colorindex = 51, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Olive Green",costs =1500, colorindex = 52, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Green",costs =1500, colorindex = 53, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gasoline Green",costs =1500, colorindex = 54, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green",costs =1500, colorindex = 92, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Blue",costs =1500, colorindex = 141, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Galaxy Blue",costs =1500, colorindex = 61, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue",costs =1500, colorindex = 62, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saxon Blue",costs =1500, colorindex = 63, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue",costs =1500, colorindex = 64, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mariner Blue",costs =1500, colorindex = 65, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Harbor Blue",costs =1500, colorindex = 66, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond Blue",costs =1500, colorindex = 67, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Surf Blue",costs =1500, colorindex = 68, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nautical Blue",costs =1500, colorindex = 69, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racing Blue",costs =1500, colorindex = 73, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ultra Blue",costs =1500, colorindex = 70, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Light Blue",costs =1500, colorindex = 74, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chocolate Brown",costs =1500, colorindex = 96, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bison Brown",costs =1500, colorindex = 101, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Creeen Brown",costs =1500, colorindex = 95, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feltzer Brown",costs =1500, colorindex = 94, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Maple Brown",costs =1500, colorindex = 97, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Beechwood Brown",costs =1500, colorindex = 103, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sienna Brown",costs =1500, colorindex = 104, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saddle Brown",costs =1500, colorindex = 98, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Moss Brown",costs =1500, colorindex = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Woodbeech Brown",costs =1500, colorindex = 102, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Straw Brown",costs =1500, colorindex = 99, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sandy Brown",costs =1500, colorindex = 105, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bleached Brown",costs =1500, colorindex = 106, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Schafter Purple",costs =1500, colorindex = 71, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spinnaker Purple",costs =1500, colorindex = 72, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Midnight Purple",costs =1500, colorindex = 142, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bright Purple",costs =1500, colorindex = 145, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cream",costs =1500, colorindex = 107, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ice White",costs =1500, colorindex = 111, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Frost White",costs =1500, colorindex = 112, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["suspension"] = {
			title = "suspensions",
			name = "suspensions",
			buttons = {
				{name = "Stock Suspension",mod = -1,modtype =15, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lowered Suspension",mod = false,modtype =15, costs = 200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Street Suspension",mod = 1,modtype =15, costs = 650, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sport Suspension",mod = 2,modtype =15, costs = 1200, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Competition Suspension",mod = 3,modtype =15, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["transmission"] = {
			title = "transmissions",
			name = "transmission",
			buttons = {
				{name = "Stock Transmission",mod = -1,modtype =13, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Street Transmission",mod = false,modtype =13, costs = 500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sports Transmission",mod = 1,modtype =13, costs = 1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Race Transmission",mod = 2,modtype =13, costs = 3000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		}
		,
		["turbo"] = {
			title = "turbo",
			name = "turbo",
			buttons = {
				{name = "None",mod = false,modtype =18, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Turbo Tuning",mod = true,modtype =18, costs = 5000, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheels"] = {
			title = "wheels",
			name = "wheels",
			buttons = {
				{name = "Wheel Type", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wheel Color", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wheel Accessories", description = "", centre = 0, font = 0, scale = 0.4},
				{name = 'Tire Smoke', description = '', centre = 0, font = 0, scale = 0.4}
			}
		},
		["wheeltype"] = {
			title = "wheel types",
			name = "wheeltype",
			buttons = {

				{name = "Sport", wtype = false, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Muscle", wtype = 1, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lowrider", wtype = 2, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Suv", wtype = 3, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Offroad", wtype = 4, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Tuner", wtype = 5, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Highend", wtype = 7, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["sport"] = {
			title = "sport",
			name = "sport",
			buttons = {
				{name = "Stock", wtype = false, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Inferno", wtype = false, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Deepfive", wtype = false, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeed", wtype = false, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamondcut", wtype = false, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chrono", wtype = false, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Feroccirr", wtype = false, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fiftynine", wtype = false, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mercie", wtype = false, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Syntheticz", wtype = false, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Organictyped", wtype = false, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov1", wtype = false, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Duper7", wtype = false, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Uzer", wtype = false, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Groundride", wtype = false, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spacer", wtype = false, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Venum", wtype = false, modtype = 23, mod = 15, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = false, modtype = 23, mod = 16, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = false, modtype = 23, mod = 17, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Icekid", wtype = false, modtype = 23, mod = 18, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Ruffeld", wtype = false, modtype = 23, mod = 19, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wangenmaster", wtype = false, modtype = 23, mod = 20, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Superfive", wtype = false, modtype = 23, mod = 21, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov2", wtype = false, modtype = 23, mod = 22, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slitsix", wtype = false, modtype = 23, mod = 23, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["suv"] = {
			title = "suv",
			name = "suv",
			buttons = {
				{name = "Stock", wtype = 3, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Vip", wtype = 3, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Benefactor", wtype = 3, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = 3, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bippu", wtype = 3, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Royalsix", wtype = 3, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fagorme", wtype = 3, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Deluxe", wtype = 3, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Icedout", wtype = 3, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cognscenti", wtype = 3, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedten", wtype = 3, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supernova", wtype = 3, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Obeyrs", wtype = 3, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedballer", wtype = 3, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Extra vaganzo", wtype = 3, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitsix", wtype = 3, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Empowered", wtype = 3, modtype = 23, mod = 15, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sunrise", wtype = 3, modtype = 23, mod = 16, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = 3, modtype = 23, mod = 17, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cutter", wtype = 3, modtype = 23, mod = 18, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["offroad"] = {
			title = "offroad",
			name = "offroad",
			buttons = {
				{name = "Stock", wtype = 4, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Raider", wtype = 4, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mudslinger", modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Nevis", wtype = 4, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cairngorm", wtype = 4, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Amazon", wtype = 4, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Challenger", wtype = 4, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dunebasher", wtype = 4, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 4, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rockcrawler", wtype = 4, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Milspecsteelie", wtype = 4, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["tuner"] = {
			title = "tuner",
			name = "tuner",
			buttons = {
				{name = "Stock", wtype = 5, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cosmo", wtype = 5, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supermesh", wtype = 5, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Outsider", wtype = 5, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rollas", wtype = 5, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Driffmeister", wtype = 5, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slicer", wtype = 5, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Elquatro", wtype = 5, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dubbed", wtype = 5, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 5, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Slideways", wtype = 5, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Apex", wtype = 5, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stancedeg", wtype = 5, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Countersteer", wtype = 5, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov1", wtype = 5, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Endov2dish", wtype = 5, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Guppez", wtype = 5, modtype = 23, mod = 15, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chokadori", wtype = 5, modtype = 23, mod = 16, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chicane", wtype = 5, modtype = 23, mod = 17, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Saisoku", wtype = 5, modtype = 23, mod = 18, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dishedeight", wtype = 5, modtype = 23, mod = 19, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fujiwara", wtype = 5, modtype = 23, mod = 20, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Zokusha", wtype = 5, modtype = 23, mod = 21, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Battlevill", wtype = 5, modtype = 23, mod = 22, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Rallymaster", wtype = 5, modtype = 23, mod = 23, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["highend"] = {
			title = "highend",
			name = "highend",
			buttons = {
				{name = "Stock", wtype = 7, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Shadow", wtype = 7, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hyper", wtype = 7, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blade", wtype = 7, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Diamond", wtype = 7, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Supagee", wtype = 7, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Chromaticz", wtype = 7, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Merciechlip", wtype = 7, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Obeyrs", wtype = 7, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gtchrome", wtype = 7, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cheetahr", wtype = 7, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solar", wtype = 7, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitten", wtype = 7, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dashvip", wtype = 7, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lozspeedten", wtype = 7, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carboninferno", wtype = 7, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonshadow", wtype = 7, modtype = 23, mod = 15, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonz", wtype = 7, modtype = 23, mod = 16, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonsolar", wtype = 7, modtype = 23, mod = 17, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carboncheetahr", wtype = 7, modtype = 23, mod = 18, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Carbonsracer", wtype = 7, modtype = 23, mod = 19, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["lowrider"] = {
			title = "lowrider",
			name = "lowrider",
			buttons = {
				{name = "Stock", wtype = 2, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Flare", wtype = 2, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wired", wtype = 2, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplegolds", wtype = 2, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bigworm", wtype = 2, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sevenfives", wtype = 2, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Splitsix", wtype = 2, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Freshmesh", wtype = 2, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Leadsled", wtype = 2, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Turbine", wtype = 2, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Superfin", wtype = 2, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicrod", wtype = 2, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dollar", wtype = 2, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dukes", wtype = 2, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lowfive", wtype = 2, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gooch", wtype = 2, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["muscle"] = {
			title = "muscle",
			name = "muscle",
			buttons = {
				{name = "Stock", wtype = 1, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicfive", wtype = 1, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dukes", wtype = 1, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musclefreak", wtype = 1, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Kracka", wtype = 1, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Azrea", wtype = 1, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mecha", wtype = 1, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blacktop", wtype = 1, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dragspl", wtype = 1, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Revolver", wtype = 1, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicrod", wtype = 1, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Spooner", wtype = 1, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Fivestar", wtype = 1, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Oldschool", wtype = 1, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Eljefe", wtype = 1, modtype = 23, mod = 13, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dodman", wtype = 1, modtype = 23, mod = 14, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sixgun", wtype = 1, modtype = 23, mod = 15, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mercenary", wtype = 1, modtype = 23, mod = 16, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["frontwheel"] = {
			title = "front wheel",
			name = "frontwheel",
			buttons = {
				{name = "Stock", wtype = 6, modtype = 23, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Speedway", wtype = 6, modtype = 23, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Streetspecial", wtype = 6, modtype = 23, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer", wtype = 6, modtype = 23, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trackstar", wtype = 6, modtype = 23, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Overlord", wtype = 6, modtype = 23, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trident", wtype = 6, modtype = 23, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplethreat", wtype = 6, modtype = 23, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stilleto", wtype = 6, modtype = 23, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wires", wtype = 6, modtype = 23, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bobber", wtype = 6, modtype = 23, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solidus", wtype = 6, modtype = 23, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Iceshield", wtype = 6, modtype = 23, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Loops", wtype = 6, modtype = 23, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["backwheel"] = {
			title = "back wheel",
			name = "backwheel",
			buttons = {
				{name = "Stock", wtype = 6, modtype = 24, mod = -1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Speedway", wtype = 6, modtype = 24, mod = false, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Streetspecial", wtype = 6, modtype = 24, mod = 1, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Racer", wtype = 6, modtype = 24, mod = 2, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trackstar", wtype = 6, modtype = 24, mod = 3, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Overlord", wtype = 6, modtype = 24, mod = 4, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Trident", wtype = 6, modtype = 24, mod = 5, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Triplethreat", wtype = 6, modtype = 24, mod = 6, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Stilleto", wtype = 6, modtype = 24, mod = 7, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Wires", wtype = 6, modtype = 24, mod = 8, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Bobber", wtype = 6, modtype = 24, mod = 9, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Solidus", wtype = 6, modtype = 24, mod = 10, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Iceshield", wtype = 6, modtype = 24, mod = 11, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Loops", wtype = 6, modtype = 24, mod = 12, costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["lights"] = {
			title = "lights",
			name = "lights",
			buttons = {
				{name = "Headlights", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Neon Kits", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neonkits"] = {
			title = "neonkits",
			name = "neonkits",
			buttons = {
				{name = "Neon Layout", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Neon Color", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neonlayout"] = {
			title = "neon layout",
			name = "neonlayout",
			buttons = {
				{name = "None",costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Front,Back and Sides",costs = 300, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["neoncolor"] = {
			title = "neon color",
			name = "neoncolor",
			buttons = {
				{name = "White", color = {255,255,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue", color = {0,0,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Electric Blue", color = {0,150,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mint Green", color = {50,255,155}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green", color = {0,255,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow", color = {255,255,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Golden Shower", color = {204,204,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange", color = {255,128,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red", color = {255,0,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pony Pink", color = {255,102,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink", color = {255,0,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Purple", color = {153,0,153}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["headlights"] = {
			title = "headlights",
			name = "headlights",
			buttons = {
				{name = "Bulbs", description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Xenon Color", description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["bulbs"] = {
			title = "bulbs",
			name = "bulbs",
			buttons = {
				{name = "Stock Lights",mod = false, modtype = 22,costs = 30, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Xenon Lights",mod = true,modtype = 22,costs = 70, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
		["headlightcolor"] = {
			title = "headlight color",
			name = "headlightcolor",
			buttons = {
				{name = "Normal", color = -1, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "White", color = 0, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue", color = 1, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Electric Blue", color = 2, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mint Green", color = 3, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green", color = 4, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow", color = 5, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Golden Shower", color = 6, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Orange", color = 7, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red", color = 8, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pony Pink", color = 9, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Hot Pink", color = 10, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Purple", color = 11, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blacklight", color = 12, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
			}
		},
		["tiresmoke"] = {
            title = "tire smoke",
            name = "tiresmoke",
            buttons = {
				{name = "White Tire Smoke", color = {254,254,254}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Gray Tire Smoke", color = {128,128,128}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
                {name = "Black Tire Smoke", color = {1,1,1}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue Tire Smoke", color = {0,0,128}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Red Tire Smoke", color = {128,0,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Green Tire Smoke", color = {0,128,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Cyan Tire Smoke", color = {10,255,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Electric Blue Tire Smoke", color = {0,150,255}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Lime Green Tire Smoke", color = {0,255,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Mint Green Tire Smoke", color = {50,255,155}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
                {name = "Yellow Tire Smoke", color = {255,255,50}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
                {name = "Orange Tire Smoke", color = {255,153,51}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Pink Tire Smoke", color = {255,102,178}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Purple Tire Smoke", color = {153,10,153}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Green Tire Smoke", color = {0,50,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Red Tire Smoke", color = {50,0,0}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Dark Blue Tire Smoke", color = {0,0,50}, costs = 100, description = "", centre = 0, font = 0, scale = 0.4},


            }
        },
		["plate"] = {
			title = "plates",
			name = "plate",
			buttons = {
				{name = "Blue on White 1",plateindex = false,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue on White 2",plateindex = 3,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Blue on White 3",plateindex = 4,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow on Blue",plateindex = 2,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Yellow on Black",plateindex = 1,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},["repair"] = {
		title = "CATEGORIES",
		name = "repair",
		buttons = {
			{name = "Repair vehicle", description = "Full body repair and engine service.", costs = 1, centre = 0, font = 0, scale = 0.4}

		}
	},
	["brakes"] = {
		title = "brakes",
		name = "brakes",
		buttons = {
			{name = "Stock Brakes",modtype = 12, mod = -1, costs = 150, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Street Brakes",modtype = 12, mod = false, costs = 500, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Sport Brakes",modtype = 12, mod = 1, costs = 1000, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Race Brakes",modtype = 12, mod = 2, costs = 2500, description = "", centre = 0, font = 0, scale = 0.4}

		}
	},
	["engine"] = {
		title = "engine tunes",
		name = "engine",
		buttons = {
			{name = "Engine Upgrade, Level 1",modtype = 11, mod = -1, costs = 8000, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Engine Upgrade, Level 2",modtype = 11, mod = false, costs = 10000, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Engine Upgrade, Level 3",modtype = 11, mod = 1, costs = 12500, description = "", centre = 0, font = 0, scale = 0.4},
			{name = "Engine Upgrade, Level 4",modtype = 11, mod = 2, costs = 18000, description = "", centre = 0, font = 0, scale = 0.4}
		}
	},
	["horn"] = {
			title = "horns",
			name = "horn",
			buttons = {
				{name = "Stock Horn",modtype = 14, mod = -1,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Truck Horn",modtype = 14, mod = false,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Police Horn",modtype = 14, mod = 1,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Clown Horn",modtype = 14, mod = 2,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musical Horn 1",modtype = 14, mod = 3,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musical Horn 2",modtype = 14, mod = 4,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musical Horn 3",modtype = 14, mod = 5,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musical Horn 4",modtype = 14, mod = 6,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Musical Horn 5",modtype = 14, mod = 7,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Sadtrombone Horn",modtype = 14, mod = 8,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 1",modtype = 14, mod = 9,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 2",modtype = 14, mod = 10,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 3",modtype = 14, mod = 11,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 4",modtype = 14, mod = 12,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 5",modtype = 14, mod = 13,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 6",modtype = 14, mod = 14,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 7",modtype = 14, mod = 15,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scaledo Horn",modtype = 14, mod = 16,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scalere Horn",modtype = 14, mod = 17,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scalemi Horn",modtype = 14, mod = 18,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scalefa Horn",modtype = 14, mod = 19,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scalesol Horn",modtype = 14, mod = 20,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scalela Horn",modtype = 14, mod = 21,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scaleti Horn",modtype = 14, mod = 22,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Scaledo Horn High",modtype = 14, mod = 23,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz Horn 1",modtype = 14, mod = 25,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz Horn 2",modtype = 14, mod = 26,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazz Horn 3",modtype = 14, mod = 27,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Jazzloop Horn",modtype = 14, mod = 28,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban Horn 1",modtype = 14, mod = 29,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban Horn 2",modtype = 14, mod = 30,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban Horn 3",modtype = 14, mod = 31,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Starspangban Horn 4",modtype = 14, mod = 32,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicalloop Horn 1",modtype = 14, mod = 33,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classical Horn 8",modtype = 14, mod = 34,costs =1500, description = "", centre = 0, font = 0, scale = 0.4},
				{name = "Classicalloop Horn 2",modtype = 14, mod = 35,costs =1500, description = "", centre = 0, font = 0, scale = 0.4}
			}
		},
	}
}

local vehiclecol = {}
local extracol = {}
local wheeltype = nil
local neoncolor = nil
local headlightcolor = nil
local plateindex = nil
local windowtint = nil
local tiresmoke = nil
local mods = {
[0] = { mod = nil },
[1] = { mod = nil },
[2] = { mod = nil },
[3] = { mod = nil },
[4] = { mod = nil },
[5] = { mod = nil },
[6] = { mod = nil },
[7] = { mod = nil },
[8] = { mod = nil },
[9] = { mod = nil },
[10] = { mod = nil },
[11] = { mod = nil },
[12] = { mod = nil },
[13] = { mod = nil },
[14] = { mod = nil },
[15] = { mod = nil },
[16] = { mod = nil },
[18] = { mod = nil },
[22] = { mod = nil },
[23] = { mod = nil },
[24] = { mod = nil },
["customtire"] = { mod = nil },
}

function f(n)
return n + 0.0001
end

function LocalPed()
return PlayerPedId()
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
function DriveInGarage()

	lsc.menu['repair'].buttons[1].costs = math.ceil((1000 - GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), false))) + (1000 - GetVehiclePetrolTankHealth(GetVehiclePedIsIn(PlayerPedId(), false))) + (1000 - GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId(), false))) * 15)
		local pos = lsc.currentpos.inside
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsUsing(ped)
		if DoesEntityExist(veh) then

			--if IsVehicleDamaged(veh) or GetVehicleEngineHealth(veh) < 1000.0 or GetVehicleBodyHealth(veh) < 1000.0 then
				--lsc.currentmenu = 'repair'
			--else
				lsc.currentmenu = "main"
			--end

			SetVehicleModKit(veh,0)
			local bumper = false
			local insrt = table.insert
			lsc.menu["main"].buttons = {}
			lsc.menu["bumpers"].buttons = {}
			for i = 0,16 do
				if GetNumVehicleMods(veh,i) ~= nil and GetNumVehicleMods(veh,i) ~= false then
						if i == 15 then
							insrt(lsc.menu["main"].buttons, {name = "Suspension", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 13 then
							insrt(lsc.menu["main"].buttons, {name = "Transmission", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 14 then
							insrt(lsc.menu["main"].buttons, {name = "Horn", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 12 then
							insrt(lsc.menu["main"].buttons, {name = "Brakes", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 11 then
							insrt(lsc.menu["main"].buttons, {name = "Engine", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 0 then
							insrt(lsc.menu["main"].buttons, {name = "Spoiler", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 1 then
							bumper = true
							insrt(lsc.menu["bumpers"].buttons, {name = "Front Bumpers", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 2 then
							bumper = true
							insrt(lsc.menu["bumpers"].buttons, {name = "Rear Bumpers", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 3 then
							insrt(lsc.menu["main"].buttons, {name = "Skirts", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 4 then
							insrt(lsc.menu["main"].buttons, {name = "Exhaust", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 5 then
							insrt(lsc.menu["main"].buttons, {name = "Roll Cage", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 6 then
							insrt(lsc.menu["main"].buttons, {name = "Grille", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 7 then
							insrt(lsc.menu["main"].buttons, {name = "Hood", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 8 then
							insrt(lsc.menu["main"].buttons, {name = "Fenders", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 9 then
							--insrt(lsc.menu["main"].buttons, {name = "Fenders2", description = "", centre = 0, font = 0, scale = 0.4})
						elseif i == 10 then
							insrt(lsc.menu["main"].buttons, {name = "Roof", description = "", centre = 0, font = 0, scale = 0.4})
						end
				end
			end

			if bumper then
			insrt(lsc.menu["main"].buttons, {name = "Bumpers", description = "", centre = 0, font = 0, scale = 0.4})
			end
			insrt(lsc.menu["main"].buttons, {name = "Lights", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Plate", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Respray", description = "Respray your vehicle", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Turbo", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Wheels", description = "", centre = 0, font = 0, scale = 0.4})
			insrt(lsc.menu["main"].buttons, {name = "Windows", description = "", centre = 0, font = 0, scale = 0.4})
			if IsThisModelABike(GetEntityModel(veh)) then
				lsc.menu["wheeltype"].buttons = {}
				insrt(lsc.menu["wheeltype"].buttons, {name = "Front Wheel", wtype = 6, description = "", centre = 0, font = 0, scale = 0.4})
				insrt(lsc.menu["wheeltype"].buttons, {name = "Back Wheel", wtype = 6, description = "", centre = 0, font = 0, scale = 0.4})
			end
			SetVehicleModKit(veh,0)
			local mod = 1
			lsc.menu["frontbumper"].buttons = {}
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["frontbumper"].buttons , {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0, tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["frontbumper"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			SetVehicleModKit(veh,0)
			mod = 2
			lsc.menu["rearbumper"].buttons = {}
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["rearbumper"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["rearbumper"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			mod = 4
			SetVehicleModKit(veh,0)
			lsc.menu["exhaust"].buttons = {}
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["exhaust"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["exhaust"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			mod = 8
			lsc.menu["fenders"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["fenders"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["fenders"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			mod = 9
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["fenders"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			mod = 7
			lsc.menu["hood"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["hood"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["hood"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 5
			lsc.menu["rollcage"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["rollcage"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["rollcage"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 10
			lsc.menu["roof"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["roof"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,    tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["roof"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 3
			lsc.menu["skirts"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["skirts"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["skirts"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 0
			lsc.menu["spoiler"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["spoiler"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["spoiler"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 6
			lsc.menu["grille"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["grille"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["grille"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end

			mod = 5
			lsc.menu["chassis"].buttons = {}
			SetVehicleModKit(veh,0)
			if GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) ~= false then
				insrt(lsc.menu["chassis"].buttons, {name = "None",modtype = mod,costs =1500,mod = -1, description = "", centre = 0, font = 0, scale = 0.4})
				for i = 0,  tonumber(GetNumVehicleMods(veh,mod)) -1 do
					local lbl = GetModTextLabel(veh,mod,i)
					if lbl ~= nil then
						local name = tostring(GetLabelText(lbl))
						if name ~= "NULL" then
							insrt(lsc.menu["chassis"].buttons, {name = name,modtype = mod,costs =1500,mod = i, description = "", centre = 0, font = 0, scale = 0.4})
						end
					end
				end
			end
			lsc.inside = true
			vehiclecol = table.pack(GetVehicleColours(veh))
			extracol = table.pack(GetVehicleExtraColours(veh))
			neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
			headlightcolor = GetVehicleHeadlightsColour(veh)
			plateindex = GetVehicleNumberPlateTextIndex(veh)
			for i,t in pairs(mods) do
				t.mod = GetVehicleMod(veh,i)
			end
			if (IsToggleModOn(veh, 18)) then
				mods[18].mod = 1;
			else
				mods[18].mod = -1;
			end
			if (IsToggleModOn(veh, 22)) then
				mods[22].mod = 1;
			else
				mods[22].mod = -1;
			end
			windowtint = GetVehicleWindowTint(veh)
            wheeltype = GetVehicleWheelType(veh)
            tiresmoke = table.pack(GetVehicleTyreSmokeColor(veh))
		end

end

function DriveOutOfGarage()
	SetStreamedTextureDictAsNoLongerNeeded("mpmissmarkers256")
	lsc.inside = false
	local ped = PlayerPedId();
	local veh = GetVehiclePedIsUsing(ped);
	lsc.menu["frontbumper"].buttons = {}
	lsc.menu["rearbumper"].buttons = {}
	lsc.menu["exhaust"].buttons = {}
	lsc.menu["fenders"].buttons = {}
	lsc.menu["hood"].buttons = {}
	lsc.menu["rollcage"].buttons = {}
	lsc.menu["roof"].buttons = {}
	lsc.menu["skirts"].buttons = {}
	lsc.menu["spoiler"].buttons = {}
	lsc.menu["grille"].buttons = {}
	lsc.menu["main"].buttons = {}
	lsc.menu["bumpers"].buttons = {}
	lsc.menu["chassis"].buttons = {}
	table.sort(lsc)
	table.sort(lsc.menu)
	lsc.menu.from = 1
	lsc.menu.to = 10
	lsc.selectedbutton = 0
	lsc.currentgarage = 0

	for i,t in pairs(mods) do
		t.mod = GetVehicleMod(veh,i)
	end
	if (IsToggleModOn(veh, 18)) then
		mods[18].mod = 1;
	else
		mods[18].mod = -1;
	end
	if (IsToggleModOn(veh, 22)) then
		mods[22].mod = 1;
	else
		mods[22].mod = -1;
	end
	mods["customtire"].mod = GetVehicleModVariation(veh,23);
	local plate = GetVehicleNumberPlateText(veh);
	if (not IsVehicleNeonLightEnabled(veh, 0)  or not IsVehicleNeonLightEnabled(veh, 1) or not IsVehicleNeonLightEnabled(veh, 2) or not IsVehicleNeonLightEnabled(veh, 3)) then
		neoncolor = {};
	end

    

	local savetable = {}
	-- PLATE
	savetable.plate = GetVehicleNumberPlateText(veh)
	savetable.plateindex = GetVehicleNumberPlateTextIndex(veh)
	-- COLOURS
	savetable.colours = {}
	local primary, secondary = GetVehicleColours(veh)
	print(primary.." "..secondary)
	savetable.colours.primary = primary
	savetable.colours.secondary = secondary
	savetable.colours.pearlone = 0
	savetable.colours.pearltwo = 0
	-- WINDOW TINT
	savetable.windows = GetVehicleWindowTint(veh)
	-- MODS
	savetable.mods = mods
	-- WHEELTYPE
    savetable.wheeltype = GetVehicleWheelType(veh)
    tiresmoke = GetVehicleTyreSmokeColor(veh)

	TriggerServerEvent('fsn_cargarage:updateVehicle', exports["fsn_cargarage"]:getCarDetails(veh))
end

function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end


function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and table.tostring( v ) or
      tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function lscdrawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function drawMenuButton(button,x,y,selected)
	SetTextFont(button.font)
	SetTextProportional(0)
	SetTextScale(button.scale, button.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(button.centre)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,lsc.menu.width,lsc.menu.height,255,255,255,255)
	else
		DrawRect(x,y,lsc.menu.width,lsc.menu.height,0,0,0,150)
	end
	DrawText(x - lsc.menu.width/2 + 0.005, y - lsc.menu.height/2 + 0.0028)
end

function drawMenuCost(button,x,y,selected)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextEntry("STRING")
	if button.costs == 0 then
		AddTextComponentString("free")
	else
		AddTextComponentString(tostring(button.costs))
	end
	DrawText(x + lsc.menu.width/2 - 0.035, y - lsc.menu.height/2 + 0.0028)
end

function drawMenuOwned(x,y,selected)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextEntry("STRING")
	AddTextComponentString("owned")
	DrawText(x + lsc.menu.width/2 - 0.035, y - lsc.menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,lsc.menu.width,lsc.menu.height,0,0,0,150)
	DrawText(x - lsc.menu.width/2 + 0.005, y - lsc.menu.height/2 + 0.0028)
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
local backlock = false
local horn = ''

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if isMech() then
		if lsc ~= nil and lsc.inside == false then
            local ped = PlayerPedId();
            local playerPos = GetEntityCoords(ped)
			if IsPedSittingInAnyVehicle(ped) then
				local veh = GetVehiclePedIsUsing(ped)
				if DoesEntityExist(veh) and (IsThisModelACar(GetEntityModel(veh)) or IsThisModelABike(GetEntityModel(veh)))  then
					for i,pos in ipairs(lsc.locations) do
						outside = pos.outside
                        --if Util.GetVecDist(playerPos, pos.inside.xyz) <= 5 then
                        if GetDistanceBetweenCoords(pos.inside.x,pos.inside.y,pos.inside.z,GetEntityCoords(ped)) <= 10 then
                            Util.DrawText3D(pos.inside.x, pos.inside.y, pos.inside.z, 'Press ~b~[ ENTER ] ~s~ to enter Mechanic Menu')
							--lscdrawTxt("Press <font color='#4286f4'>ENTER~w~ to enter <font color='#4286f4'>Los Santos Customs ",4,1,0.5,0.8,1.0,255,255,255,255)
							if IsControlJustPressed(1,201) then
									lsc.currentpos = pos
									lsc.currentgarage = i
									DriveInGarage()
							end
						end
					end
				end
			end
		elseif lsc ~= nil then
			local ped = PlayerPedId();
			local veh = GetVehiclePedIsUsing(ped)
			if (lsc.currentpos and GetDistanceBetweenCoords(lsc.currentpos.inside.x,lsc.currentpos.inside.y,lsc.currentpos.inside.z,GetEntityCoords(ped)) > 10) then
				DriveOutOfGarage();
			end
			local menu = lsc.menu[lsc.currentmenu]
					lscdrawTxt(lsc.title,1,1,lsc.menu.x,lsc.menu.y,1.0, 255,255,255,255)
					drawMenuTitle(menu.title, lsc.menu.x,lsc.menu.y + 0.08)
					lscdrawTxt(lsc.selectedbutton.."/"..tablelength(menu.buttons),0,0,lsc.menu.x + lsc.menu.width/2 - 0.0328,lsc.menu.y + 0.066,0.4, 255,255,255,255)
					local y = lsc.menu.y + 0.12
					buttoncount = tablelength(menu.buttons)
					local selected = false

					for i,button in pairs(menu.buttons) do
						if i >= lsc.menu.from and i <= lsc.menu.to then

							if i == lsc.selectedbutton then
								selected = true
							else
								selected = false
							end
							drawMenuButton(button,lsc.menu.x,y,selected)
							if button.costs ~= nil then
								if lsc.currentmenu == "bulbs" then
									if button.name == "Stock Lights"  then
										if not IsToggleModOn(veh, button.modtype)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Xenon Lights"  then
										if IsToggleModOn(veh, button.modtype) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end

								elseif lsc.currentmenu == "turbo" then
									if button.name == "None"  then
										if not IsToggleModOn(veh, button.modtype)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Turbo Tuning"  then
										if IsToggleModOn(veh, button.modtype) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end

								elseif lsc.currentmenu == "plate" then
									if plateindex == button.plateindex then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "chassis" or lsc.currentmenu == "armor" or lsc.currentmenu == "brakes" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "engine" or lsc.currentmenu == "fenders" or lsc.currentmenu == "hood" or lsc.currentmenu == "transmission" or lsc.currentmenu == "suspension" or lsc.currentmenu == "spoiler" or lsc.currentmenu == "skirts" or lsc.currentmenu == "roof" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "horn" or lsc.currentmenu == "grille" then
									if button.mod == -1  then
										if mods[button.modtype].mod == -1 then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.mod == 0 or button.mod == false then
										if mods[button.modtype].mod == false or mods[button.modtype].mod == 0 then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									else
										if mods[button.modtype].mod == button.mod then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif  lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
									if button.mod == -1  then
										if mods[button.modtype].mod == -1 and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.mod == 0 or button.mod == false then
										if (mods[button.modtype].mod == false or mods[button.modtype].mod == 0) and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									else
										if mods[button.modtype].mod == button.mod and wheeltype == button.wtype then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif lsc.currentmenu == "neonlayout" then
									if button.name == "None" then
										if IsVehicleNeonLightEnabled(veh, 0) == false and IsVehicleNeonLightEnabled(veh, 1) == false  and IsVehicleNeonLightEnabled(veh, 2) == false and IsVehicleNeonLightEnabled(veh, 3) == false then
											drawMenuOwned(lsc.menu.x,y,selected)
										end
									elseif button.name == "Front,Back and Sides" then
										if IsVehicleNeonLightEnabled(veh, 0)  and IsVehicleNeonLightEnabled(veh, 1)  and IsVehicleNeonLightEnabled(veh, 2)  and IsVehicleNeonLightEnabled(veh, 3)  then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
								elseif lsc.currentmenu == "neoncolor" then
									if button.color[1] == neoncolor[1] and button.color[2] == neoncolor[2] and button.color[3] == neoncolor[3] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "headlightcolor" then
									if button.color == headlightcolor then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal" or lsc.currentmenu == "primarymetallic") then
									if button.colorindex == vehiclecol[1] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal" or lsc.currentmenu == "secondarymetallic") then
									if button.colorindex == vehiclecol[2] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif (lsc.currentmenu == "pearlescentclassic" or lsc.currentmenu == "pearlescentchrome" or lsc.currentmenu == "pearlescentmatte" or lsc.currentmenu == "pearlescentmetal" or lsc.currentmenu == "pearlescentmetallic") then
									if button.colorindex == extracol[1] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "wheelcolor" then
									if button.colorindex == extracol[2] then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								elseif lsc.currentmenu == "wheelaccessories" then
									if button.name == "Stock Tires" then
										if GetVehicleModVariation(veh,23) == false then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									elseif button.name == "Custom Tires" then
										if GetVehicleModVariation(veh,23) then
											drawMenuOwned(lsc.menu.x,y,selected)
										else
											drawMenuCost(button,lsc.menu.x,y,selected)
										end
									end
                                elseif lsc.currentmenu == "tiresmoke" then
                                    if button.color[1] == tiresmoke[1] and button.color[2] == tiresmoke[2] and button.color[3] == tiresmoke[3] then
                                        drawMenuOwned(lsc.menu.x,y,selected)
                                    else
                                        drawMenuCost(button,lsc.menu.x,y,selected)
                                    end
								elseif lsc.currentmenu == "windows" then
									if windowtint == button.tint then
										drawMenuOwned(lsc.menu.x,y,selected)
									else
										drawMenuCost(button,lsc.menu.x,y,selected)
									end
								else
									drawMenuCost(button,lsc.menu.x,y,selected)
								end
							end
							y = y + 0.04
								if selected then
									if (lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal" or lsc.currentmenu == "primarymetallic") then
										if button.colorindex ~= nil then
											SetVehicleColours(veh,button.colorindex,vehiclecol[2])
										end
									end
									if (lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal" or lsc.currentmenu == "secondarymetallic") then
										if button.colorindex ~= nil then
											SetVehicleColours(veh,vehiclecol[1],button.colorindex)
										end
									end
									if (lsc.currentmenu == "pearlescentclassic" or lsc.currentmenu == "pearlescentchrome" or lsc.currentmenu == "pearlescentmatte" or lsc.currentmenu == "pearlescentmetal" or lsc.currentmenu == "pearlescentmetallic") then
										if button.colorindex ~= nil then
											SetVehicleExtraColours(veh, button.colorindex, extracol[2]);
										end
									end
									if (lsc.currentmenu == "wheelcolor") then
										if button.colorindex ~= nil then
											SetVehicleExtraColours(veh, extracol[1], button.colorindex)
										end
									end
									if lsc.currentmenu == "horn" or lsc.currentmenu == "roof" or lsc.currentmenu == "suspension" or lsc.currentmenu == "horns" or lsc.currentmenu == "hood" or lsc.currentmenu == "grille" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "skirts" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "spoiler"  then
										SetVehicleMod(veh, button.modtype, button.mod)

									end
									if  lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
										SetVehicleMod(veh, button.modtype, button.mod)
									end

									if lsc.currentmenu == "fenders" then
										if button.mod == -1 then
											SetVehicleMod(veh, 8, button.mod)
											SetVehicleMod(veh, 9, button.mod)
										else
										SetVehicleMod(veh, button.modtype, button.mod)
										end
									end

									if lsc.currentmenu == "horn" then
										if horn ~= button.name then
											horn = button.name
										end
									end
									if lsc.currentmenu == "windows" then
										SetVehicleWindowTint(veh, button.tint)
                                    end
                                    if lsc.currentmenu == "tiresmoke" then
										print(table.unpack(tiresmoke))
										SetVehicleModKit(veh,0)
										ToggleVehicleMod(veh,20,true)
										SetVehicleTyreSmokeColor(veh,button.color[1],button.color[2],button.color[3])
									end
									if lsc.currentmenu == "neoncolor" then
										SetVehicleNeonLightsColour(veh,button.color[1],button.color[2],button.color[3])
									end
									if lsc.currentmenu == "headlightcolor" then
										--print(button.color[1],button.color[2],button.color[3])
										SetVehicleHeadlightsColour(veh,button.color)
									end
									if lsc.currentmenu == "plate" then
										SetVehicleNumberPlateTextIndex(veh,button.plateindex)
									end
								end
								if selected and IsControlJustPressed(1,201) then
									ButtonSelected(button)
								end
						end
					end

		end
		if lsc ~= nil and lsc.inside then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if lsc.selectedbutton > 1 then
					lsc.selectedbutton = lsc.selectedbutton -1
					if buttoncount > 10 and lsc.selectedbutton < lsc.menu.from then
						lsc.menu.from = lsc.menu.from -1
						lsc.menu.to = lsc.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if lsc.selectedbutton < buttoncount then
					lsc.selectedbutton = lsc.selectedbutton +1
					if buttoncount > 10 and lsc.selectedbutton > lsc.menu.to then
						lsc.menu.to = lsc.menu.to + 1
						lsc.menu.from = lsc.menu.from + 1
					end
				end
			end
		end
    end
	end
end)


function ButtonSelected(button)
	local ped = PlayerPedId()
	local car = GetVehiclePedIsUsing(ped)
	if lsc.currentmenu == "repair" then
		if button.name == "Repair vehicle" then
			--if (moneycheck(button.costs)) then
				DecorSetBool(car, "keepingVehicleOnFire", 0)
				--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
				SetVehicleFixed(car)
				OpenMenu('main')
			--end
		end
	elseif lsc.currentmenu == "main" then
		if button.name == "Respray" then
			OpenMenu("respray")
		-- elseif button.name == "Armor" then
		-- 	SetVehicleModKit(car,0)
		-- 	OpenMenu("armor")
		elseif button.name == "Brakes" then
			SetVehicleModKit(car,0)
			OpenMenu("brakes")
		elseif button.name == "Bumpers" then
			SetVehicleModKit(car,0)
			OpenMenu("bumpers")
		elseif button.name == "Engine" then
			SetVehicleModKit(car,0)
			OpenMenu("engine")
		elseif button.name == "Exhaust" then
			SetVehicleModKit(car,0)
			OpenMenu("exhaust")
		elseif button.name == "Fenders" then
			SetVehicleModKit(car,0)
			OpenMenu("fenders")
		elseif button.name == "Hood" then
			SetVehicleModKit(car,0)
			OpenMenu("hood")
		elseif button.name == "Horn" then
			SetVehicleModKit(car,0)
			OpenMenu("horn")
		elseif button.name == "Lights" then
			SetVehicleModKit(car,0)
			OpenMenu("lights")

		elseif button.name == "Roll Cage" then
			SetVehicleModKit(car,0)
			OpenMenu("rollcage")
		elseif button.name == "Roof" then
			SetVehicleModKit(car,0)
			OpenMenu("roof")
		elseif button.name == "Skirts" then
			SetVehicleModKit(car,0)
			OpenMenu("skirts")
		elseif button.name == "Spoiler" then
			SetVehicleModKit(car,0)
			OpenMenu("spoiler")
		elseif button.name == "Suspension" then
			SetVehicleModKit(car,0)
			OpenMenu("suspension")
		elseif button.name == "Transmission" then
			SetVehicleModKit(car,0)
			OpenMenu("transmission")
		elseif button.name == "Plate" then
			SetVehicleModKit(car,0)
			OpenMenu("plate")
		elseif button.name == "Horn" then
			SetVehicleModKit(car,0)
			OpenMenu("horn")
		elseif button.name == "Grille" then
			SetVehicleModKit(car,0)
			OpenMenu("grille")
		elseif button.name == "Turbo" then
			SetVehicleModKit(car,0)
			OpenMenu("turbo")
		elseif button.name == "Chassis" then
			SetVehicleModKit(car,0)
			OpenMenu("chassis")
		elseif button.name == "Wheels" then
			SetVehicleModKit(car,0)
			OpenMenu("wheels")
		elseif button.name == "Windows" then
			SetVehicleModKit(car,0)
			OpenMenu("windows")
		end
	elseif lsc.currentmenu == "respray" then
		if button.name == "Primary Color" then
			OpenMenu("primarycolor")
		elseif button.name == "Secondary Color" then
			OpenMenu("secondarycolor")
		elseif button.name == "Pearlescent Color" then
			OpenMenu("pearlescentcolor")
		end
	elseif lsc.currentmenu == "primarycolor" then
		if button.name == "Chrome" then
			OpenMenu("primarychrome")
		elseif button.name == "Classic" then
			OpenMenu("primaryclassic")
		elseif button.name == "Matte" then
			OpenMenu("primarymatte")
		elseif button.name == "Metals" then
			OpenMenu("primarymetal")
		elseif button.name == "Metallic" then
			OpenMenu("primarymetallic")
		end
	elseif lsc.currentmenu == "secondarycolor" then
		if button.name == "Chrome" then
			OpenMenu("secondarychrome")
		elseif button.name == "Classic" then
			OpenMenu("secondaryclassic")
		elseif button.name == "Matte" then
			OpenMenu("secondarymatte")
		elseif button.name == "Metals" then
			OpenMenu("secondarymetal")
		elseif button.name == "Metallic" then
			OpenMenu("secondarymetallic")
		end
	elseif lsc.currentmenu == "pearlescentcolor" then
		if button.name == "Chrome" then
			OpenMenu("pearlescentchrome")
		elseif button.name == "Classic" then
			OpenMenu("pearlescentclassic")
		elseif button.name == "Matte" then
			OpenMenu("pearlescentmatte")
		elseif button.name == "Metals" then
			OpenMenu("pearlescentmetal")
		elseif button.name == "Metallic" then
			OpenMenu("pearlescentmetallic")
		end
	elseif lsc.currentmenu == "primarychrome" then --and moneycheck(button.costs) then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primaryclassic" then --and moneycheck(button.costs) then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymatte" then --and moneycheck(button.costs) then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymetal" then --and moneycheck(button.costs) then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "primarymetallic" then --and moneycheck(button.costs) then
		vehiclecol[1] = button.colorindex
	elseif lsc.currentmenu == "secondarychrome" then --and moneycheck(button.costs) then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondaryclassic" then --and moneycheck(button.costs) then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymatte" then --and moneycheck(button.costs) then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymetal" then --and moneycheck(button.costs) then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "secondarymetallic" then --and moneycheck(button.costs) then
		vehiclecol[2] = button.colorindex
	elseif lsc.currentmenu == "pearlescentchrome" then --and moneycheck(button.costs) then
		extracol[1] = button.colorindex
	elseif lsc.currentmenu == "pearlescentclassic" then -- and moneycheck(button.costs) then
		extracol[1] = button.colorindex
	elseif lsc.currentmenu == "pearlescentmatte" then --and moneycheck(button.costs) then
		extracol[1] = button.colorindex
	elseif lsc.currentmenu == "pearlescentmetal" then -- and moneycheck(button.costs) then
		extracol[1] = button.colorindex
	elseif lsc.currentmenu == "pearlescentmetallic" then --and moneycheck(button.costs) then
		extracol[1] = button.colorindex
	elseif lsc.currentmenu == "bumpers" then
		if button.name == "Front Bumpers" then
			OpenMenu("frontbumper")
		elseif button.name == "Rear Bumpers" then
			OpenMenu("rearbumper")
		end
	elseif lsc.currentmenu == "lights" then
		if button.name == "Headlights" then
			SetVehicleModKit(car,0)
			OpenMenu('headlights')
		elseif button.name == "Neon Kits" then
			OpenMenu('neonkits')
		end
	elseif lsc.currentmenu == "neonkits" then
		if button.name == "Neon Layout" then
			OpenMenu('neonlayout')
		elseif button.name == "Neon Color" then
			OpenMenu('neoncolor')
		end
	elseif lsc.currentmenu == "headlights" then
		if button.name == "Bulbs" then
			OpenMenu('bulbs')
		elseif button.name == "Xenon Color" then
			OpenMenu('headlightcolor')
		end
	elseif lsc.currentmenu == "bulbs" then
		if button.name == "Stock Lights" then
			ToggleVehicleMod(car, 22, false)
			mods[22].mod = -1;

		elseif button.name == "Xenon Lights" then --and moneycheck(button.costs) then
			--if (moneycheck(button.costs)) then
				ToggleVehicleMod(car, 22, true)
				mods[22].mod = 1;
			--end
		end
	elseif lsc.currentmenu == "plate" then
		plateindex = button.plateindex
	elseif lsc.currentmenu == "chassis" or lsc.currentmenu == "armor" or lsc.currentmenu == "brakes" or lsc.currentmenu == "frontbumper" or lsc.currentmenu == "rearbumper" or lsc.currentmenu == "engine" or lsc.currentmenu == "exhaust" or lsc.currentmenu == "hood" or lsc.currentmenu == "horn" or lsc.currentmenu == "rollcage" or lsc.currentmenu == "roof" or lsc.currentmenu == "skirts" or lsc.currentmenu == "spoiler" or lsc.currentmenu == "suspension" or lsc.currentmenu == "transmission" or lsc.currentmenu == "grille" or lsc.currentmenu == "horn" then
		--if (moneycheck(button.costs)) then
			--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
			mods[button.modtype].mod = button.mod
			SetVehicleMod(car,button.modtype,button.mod)
		--end
	elseif lsc.currentmenu == "fenders" then
		if button.name == "None" then
			mods[8].mod = button.mod
			mods[9].mod = button.mod
			SetVehicleMod(car,9,button.mod)
			SetVehicleMod(car,8,button.mod)
        else 
            --(moneycheck(button.costs)) then
			--if (moneycheck(button.costs)) then
				--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
				mods[button.modtype].mod = button.mod
				SetVehicleMod(car,button.modtype,button.mod)
			--end
		end
	elseif lsc.currentmenu == "turbo" then
		if button.name == "None" then
			ToggleVehicleMod(car, button.modtype, false)
			mods[18].mod = -1;

		elseif button.name == "Turbo Tuning" then --and moneycheck(button.costs) then
			--if (moneycheck(button.costs)) then
				--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
				ToggleVehicleMod(car, button.modtype, true)
				mods[18].mod = 1;
			--end
		end
	elseif lsc.currentmenu == "wheels" then
		if button.name == "Wheel Type" then
			OpenMenu('wheeltype')
		elseif button.name == "Wheel Color" then
			OpenMenu('wheelcolor')
		elseif button.name == "Wheel Accessories" then
			SetVehicleModKit(car,0)
            OpenMenu("wheelaccessories")
		elseif button.name == "Tire Smoke" then
            OpenMenu('tiresmoke')
        end
	elseif lsc.currentmenu == "wheeltype" then
		if button.name == "Stock" then
			SetVehicleWheelType(car,-1)
		elseif button.name == "Front Wheel" then --and moneycheck(button.costs) then
			SetVehicleWheelType(car,button.wtype)
			OpenMenu("frontwheel")
		elseif button.name == "Back Wheel" then --and moneycheck(button.costs) then
			SetVehicleWheelType(car,button.wtype)
			OpenMenu("backwheel")
		else
			SetVehicleWheelType(car,button.wtype)
			OpenMenu(button.name:lower())
        end
	elseif lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "backwheel" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
		--if (moneycheck(button.costs)) then
			--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
			wheeltype = button.wtype
			mods[button.modtype].mod = button.mod
			SetVehicleMod(car,button.modtype,button.mod)
		--end
	elseif lsc.currentmenu == "wheelcolor" then -- and moneycheck(button.costs) then
        extracol[2] = button.colorindex
	elseif lsc.currentmenu == "windows" then -- and moneycheck(button.costs) then
		windowtint = button.tint
	elseif lsc.currentmenu == "wheelaccessories" then
		if button.name == "Stock Tires" then -- and moneycheck(button.costs) then
			SetVehicleModKit(car,0)
			SetVehicleMod(car,23,mods[23].mod,false)
			if IsThisModelABike(GetEntityModel(car)) then
				SetVehicleModKit(car,0)
				SetVehicleMod(car,24,mods[24].mod,false)
			end
		elseif button.name == "Custom Tires" then --and moneycheck(button.costs) then
			--if (moneycheck(button.costs)) then
				--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
				SetVehicleModKit(car,0)
				SetVehicleMod(car,23,mods[23].mod,true)
				if IsThisModelABike(GetEntityModel(car)) then
					SetVehicleModKit(car,0)
					SetVehicleMod(car,24,mods[24].mod,true)
				end
			--end
		end
    elseif lsc.currentmenu == "tiresmoke" then --and moneycheck(button.costs) then
        --TriggerEvent('fsn_bank:change:walletMinus', button.costs)
        tiresmoke[1] = button.color[1]
        tiresmoke[2] = button.color[2]
        tiresmoke[3] = button.color[3]
	elseif lsc.currentmenu == "neonlayout" then
		if button.name == "None" then
			SetVehicleNeonLightEnabled(car,0,false)
			SetVehicleNeonLightEnabled(car,1,false)
			SetVehicleNeonLightEnabled(car,2,false)
			SetVehicleNeonLightEnabled(car,3,false)
			SetVehicleNeonLightsColour(car,255,255,255)
			neoncolor[1] = nil
			neoncolor[2] = nil
			neoncolor[3] = nil
        else 
            --moneycheck(button.costs) then
			--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
			neoncolor[1] = 255
			neoncolor[2] = 255
			neoncolor[3] = 255
			SetVehicleNeonLightsColour(car,255,255,255)
			SetVehicleNeonLightEnabled(car,0,true)
			SetVehicleNeonLightEnabled(car,1,true)
			SetVehicleNeonLightEnabled(car,2,true)
			SetVehicleNeonLightEnabled(car,3,true)
		end
	elseif lsc.currentmenu == "neoncolor" then --and moneycheck(button.costs) then
		--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
		neoncolor[1] = button.color[1]
		neoncolor[2] = button.color[2]
		neoncolor[3] = button.color[3]
	elseif lsc.currentmenu == "headlightcolor" and moneycheck(button.costs) then
		TriggerEvent('fsn_bank:change:walletMinus', button.costs)
		headlightcolor = button.color
    end
end

function OpenMenu(menu)
	lsc.lastmenu = lsc.currentmenu
	if menu == "bumpers" then
		lsc.lastmenu = "main"
	elseif menu ~= "secondarycolor" and stringstarts(menu, "secondary") then
		lsc.lastmenu = "secondarycolor"
	elseif menu ~= "primarycolor" and stringstarts(menu, "primary") then
		lsc.lastmenu = "primarycolor"
	elseif menu ~= "pearlescentcolor" and stringstarts(menu, "pearlescent") then
		lsc.lastmenu = "pearlescentcolor"
	elseif menu == "primarycolor" or menu == "secondarycolor" or menu == "pearlescentcolor" then
		lsc.lastmenu = "respray"
	elseif menu == "respray"  then
		lsc.lastmenu = "main"
	elseif menu == "wheels" then
		lsc.lastmenu = "main"
	elseif menu == "wheeltype" then
		lsc.lastmenu = "wheels"
	elseif menu == "wheelcolor" then
		lsc.lastmenu = "wheels"
	elseif menu == "wheelaccessories" then
		lsc.lastmenu = "wheels"
	elseif menu == "tiresmoke" then
        lsc.lastmenu = "wheels"
	elseif menu == "lights" then
		lsc.lastmenu = "main"
	elseif menu == "neonkits" then
		lsc.lastmenu = "lights"
	elseif menu == "headlights" then
		lsc.lastmenu = "lights"
	end
	lsc.menu.from = 1
	lsc.menu.to = 10
	lsc.selectedbutton = 0
	lsc.currentmenu = menu
end


function Back()
	if backlock then
		return
	end
	backlock = true
	local ped = PlayerPedId()
	local car = GetVehiclePedIsUsing(ped)
	if lsc.currentmenu == "main" or lsc.currentmenu == "repair" then
		DriveOutOfGarage()
	elseif lsc.currentmenu == "primarychrome" or lsc.currentmenu == "primaryclassic" or lsc.currentmenu == "primarymatte" or lsc.currentmenu == "primarymetal" or lsc.currentmenu == "primarymetallic" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "secondarychrome" or lsc.currentmenu == "secondaryclassic" or lsc.currentmenu == "secondarymatte" or lsc.currentmenu == "secondarymetal" or lsc.currentmenu == "secondarymetallic" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "secondarymetallic" then
		SetVehicleColours(car, vehiclecol[1], vehiclecol[2])
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "pearlescentchrome" or lsc.currentmenu == "pearlescentclassic" or lsc.currentmenu == "pearlescentmatte" or lsc.currentmenu == "pearlescentmetal" or lsc.currentmenu == "pearlescentmetallic" then
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "wheelcolor" then
		SetVehicleExtraColours(car, extracol[1], extracol[2])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "sport" or lsc.currentmenu == "muscle" or lsc.currentmenu == "lowrider" or lsc.currentmenu == "frontwheel" or lsc.currentmenu == "highend" or lsc.currentmenu == "suv" or lsc.currentmenu == "offroad" or lsc.currentmenu == "tuner" then
		SetVehicleWheelType(car,wheeltype)
		SetVehicleMod(car,23,mods[23].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "backwheel" then
		SetVehicleWheelType(car,wheeltype)
		SetVehicleMod(car,24,mods[24].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "spoiler" then
		SetVehicleMod(car,0,mods[0].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "frontbumper" then
		SetVehicleMod(car,1,mods[1].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "rearbumper" then
		SetVehicleMod(car,2,mods[2].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "skirts" then
		SetVehicleMod(car,3,mods[3].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "exhaust" then
		SetVehicleMod(car,4,mods[4].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "rollcage" then
		SetVehicleMod(car,5,mods[5].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "grille" then
		SetVehicleMod(car,6,mods[6].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "hood" then
		SetVehicleMod(car,7,mods[7].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "fenders" then
		SetVehicleMod(car,8,mods[8].mod)
		SetVehicleMod(car,9,mods[9].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "" then
		SetVehicleMod(car,9,mods[9].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "roof" then
		SetVehicleMod(car,10,mods[10].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "horn" then
		SetVehicleMod(car,14,mods[14].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "suspension" then
		SetVehicleMod(car,15,mods[15].mod)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "windows" then
		SetVehicleWindowTint(car, windowtint)
        OpenMenu(lsc.lastmenu)
    elseif lsc.currentmenu == "tiresmoke" then
		SetVehicleTyreSmokeColor(car, tiresmoke[1],tiresmoke[2],tiresmoke[3])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "neoncolor" then
		SetVehicleNeonLightsColour(car,neoncolor[1],neoncolor[2],neoncolor[3])
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "headlightcolor" then
		SetVehicleHeadlightsColour(car,headlightcolor)
		OpenMenu(lsc.lastmenu)
	elseif lsc.currentmenu == "plate" then
		SetVehicleNumberPlateTextIndex(car,plateindex)
		OpenMenu(lsc.lastmenu)
	else
		OpenMenu(lsc.lastmenu)
	end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
