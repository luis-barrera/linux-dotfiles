local wibox    = require("wibox")
local math     = math
local string   = string
local gears    = require("gears")
local tostring = tostring

local countdown = {
	widget   = wibox.widget.textbox(),
	checkbox = wibox.widget {
		checked      = false,
		check_color  = beautiful.fg_focus,  -- customize
		border_color = beautiful.fg_normal, -- customize
		border_width = 2,                   -- customize
		shape        = gears.shape.circle,
		widget       = wibox.widget.checkbox
	}
}

function countdown.set()
	awful.prompt.run {
		prompt       = "Countdown minutes: ", -- floats accepted
		textbox      = awful.screen.focused().mypromptbox.widget,
		exe_callback = function(timeout)
			countdown.seconds = tonumber(timeout)
			if not countdown.seconds then return end
			countdown.checkbox.checked = false
			countdown.minute_t = countdown.seconds > 1 and "minutes" or "minute"
			countdown.seconds = countdown.seconds * 60
			countdown.timer = gears.timer({ timeout = 1 })
			countdown.timer:connect_signal("timeout", function()
				if countdown.seconds > 0 then
					local minutes = math.floor(countdown.seconds / 60)
					local seconds = math.fmod(countdown.seconds, 60)
					countdown.widget:set_markup(string.format("%d:%02d", minutes, seconds))
					countdown.seconds = countdown.seconds - 1
				else
					naughty.notify({
						title = "Countdown",
						text  = string.format("%s %s timeout", timeout, countdown.minute_t)
					})
					countdown.widget:set_markup("")
					countdown.checkbox.checked = true
					countdown.timer:stop()
				end
			end)
			countdown.timer:start()
		end
	}
end

countdown.checkbox:buttons(awful.util.table.join(
	awful.button({}, 1, function() countdown.set() end), -- left click
	awful.button({}, 3, function() -- right click
		if countdown.timer and countdown.timer.started then
			countdown.widget:set_markup("")
			countdown.checkbox.checked = false
			countdown.timer:stop()
			naughty.notify({ title = "Countdown", text  = "Timer stopped" })
		end
	end)
))
