function SetQueueMax(queue, max)
	local tmp = {
		queue = tostring(queue),
		max = tonumber(max)
	}
	SendNUIMessage({maxNotifications = tmp})
end

function SendNotification(options)
	options.animation = options.animation or {}
	options.sounds = options.sounds or {}
	options.docTitle = options.docTitle or {}

	local options = {
		type = options.type or "info",
		layout = options.layout or "topRight",
		-- theme = options.theme or "gta",
		theme = "nowegezy",
		text = Kolorek(options.text) or " Powiadomienie",

		timeout = options.timeout or 5000,
		-- progressBar = options.progressBar ~= false and true or false,
		progressBar = false,
		closeWith = options.closeWith or {},
		animation = {
			open = options.animation.open or "noty_effects_open",
			close = options.animation.close or "noty_effects_close"
		},
		sounds = {
			volume = options.sounds.volume or 0.5,
			conditions = options.sounds.conditions or {"docVisible"},
			sources = options.sounds.sources or {"notif.wav"}
		},
		docTitle = {
			conditions = options.docTitle.conditions or {}
		},
		modal = options.modal or false,
		id = options.id or false,
		force = options.force or false,
		queue = options.queue or "global",
		killer = options.killer or false,
		container = options.container or false,
		buttons = options.button or false
	}

	SendNUIMessage({options = options})
end

RegisterNetEvent("waitrp_notify:SendNotification")
AddEventHandler("waitrp_notify:SendNotification", function(options)
	SendNotification(options)
end)

RegisterNetEvent("waitrp_notify:SetQueueMax")
AddEventHandler("waitrp_notify:SetQueueMax", function(queue, max)
	SetQueueMax(queue, max)
end)

function Kolorek(text)
	for i = 1, #kolorki do
		for k = 1, #kolorki[i][1] do
			text = string.gsub(text, kolorki[i][1][k], kolorki[i][2])
		end
	end
	return text
end

kolorki = {
	{
		{"~w~", "~W~", "~s~", "~S~", "~c~", "~C~", "~r~", "~R~", "~g~", "~G~", "~b~", "~B~", "~y~", "~Y~", "~p~", "~P~", "~m~", "~M~", "~u~", "~U~", "~o~", "~O~"},
		'<span style="color: #ffffff;">',
	},
}