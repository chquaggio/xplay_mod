function add_xplay_overlay()
	G.FUNCS.get_xvalue = function(e) end

	G.UIDEF.xplay_overlay = function()
		play_sound("coin2")
		local text_scale = 0.75
		local t = create_UIBox_generic_options({
			contents = {
				{
					n = G.UIT.R,
					config = { align = "cm", padding = 0 },
					nodes = {
						{
							n = G.UIT.R,
							config = { align = "cm", padding = 0.1, colour = G.C.UI.BACKGROUND, shadow = true },
							nodes = {
								{
									n = G.UIT.T,
									config = {
										text = "XPlay",
										scale = text_scale * 0.5,
										align = "cm",
										colour = G.C.UI.TEXT_LIGHT,
									},
								},
							},
						},
						{
							n = G.UIT.R,
							config = { align = "cm", padding = 0.1, colour = G.C.UI.BACKGROUND, shadow = true },
							nodes = {
								{
									n = G.UIT.T,
									config = {
										text = "Play the action with the highest expected value",
										scale = text_scale * 0.5,
										align = "cm",
										colour = G.C.UI.TEXT_LIGHT,
									},
								},
							},
						},
					},
				},
			},
		})
		return t
	end

	G.FUNCS.get_xplay = function(e)
		G.SETTINGS.paused = true

		G.FUNCS.overlay_menu({ definition = G.UIDEF.xplay_overlay() })
	end
end
