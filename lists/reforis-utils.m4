
local function reforis_plugin(...)
	for _, plugin in pairs({...}) do
		fplugin = "reforis-" .. plugin .. "-plugin"
		Install(fplugin, { priority = 40 })
		if for_l10n then
			for_l10n(fplugin .. "-l10n-")
		end
	end
end

