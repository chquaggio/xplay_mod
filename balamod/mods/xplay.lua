if sendDebugMessage == nil then
	sendDebugMessage = function(_) end
end

local inject_ui = function()
	local to_patch = "local button_height = 1.3"
	local patch = [[
  local button_height = 1.3
  add_xplay_overlay()
  sendDebugMessage("Hand cards:")
  local inspect = get_inspect()
  sendDebugMessage(inspect(G.hand.cards))
  local xplay_button = {n=G.UIT.C, config={id = 'xplay_button', align = "tm", minw = 2.5, padding = 0.3, r = 0.1, hover = true, colour = G.C.BLACK, button = "get_xplay", shadow = true}, nodes={
    {n=G.UIT.R, config={align = "bcm", padding = 0}, nodes={
      {n=G.UIT.T, config={text = "XPlay", scale = text_scale, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
    }},
  }}
  ]]
	inject("functions/UI_definitions.lua", "create_UIBox_buttons", to_patch:gsub("([^%w])", "%%%1"), patch)
	local to_patch2 = "G.SETTINGS.play_button_pos == 1 and play_button or discard_button,"
	local patch2 = [[
  G.SETTINGS.play_button_pos == 1 and play_button or discard_button,
  xplay_button,
  ]]
	inject("functions/UI_definitions.lua", "create_UIBox_buttons", to_patch2:gsub("([^%w])", "%%%1"), patch2)
	sendDebugMessage("Patched xplay mod !")
end

table.insert(mods, {
	mod_id = "xplay",
	name = "Xplay",
	version = "0.0.1",
	author = "Christian Quaggio",
	description = {
		"Shows the action with the highest expected value",
	},
	enabled = true,
	on_enable = function()
		inject_ui()
	end,
})
