include(utils.m4)dnl
include(luci-utils.m4)dnl
_FEATURE_GUARD_

if board == "omnia" or board == "turris1x" then
	luci_app('rainbow')
end

-- Additional protocols
luci_app("ahcp", "bcp38")
luci_proto("relay")


if options and options.adblock then
	luci_app("adblock")
end

if options and options.sqm then
	luci_app("sqm")
end

if options and options.tinyproxy then
	luci_app("tinyproxy")
end

if options and options.upnp then
	luci_app("upnp")
end

if options and options.printserver then
	Install("kmod-usb-printer", { priority = 40 })
	luci_app("p910nd")
end

if options and options.statistics then
	luci_app("statistics")
end

_END_FEATURE_GUARD_
