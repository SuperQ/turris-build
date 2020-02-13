-- Fixes and hacks to migrate from older setups

-- ABI changed in libubus with version 2019-12-27
if not version_match or not installed or
		(installed["libubus"] and version_match(installed["libubus"].version, "<2019-12-27")) then
	Package("libubus", { abi_change = true })
end

-- Migrate from Samba3 to Samba4
if not installed or (installed["samba36-server"] and not installed["samba4-server"]) then
	-- This effectively detects that users has Samba3 installed and is installing Samba4
	-- In such case we want to also install fix package to migrate samba config.
	local extra = {}
	if features.request_condition then
		extra.condition = "samba4-server"
	end
	Install("fix-samba-migrate-to-samba4", extra)
	--[[
	We do here hack. If updater is not supporting request conditions then we just
	install Samba4 server possibly just to migrate to it and remove it later. If
	it is requested then it stayes installed. Later updater is going to detect
	migration correctly and run this fix.
	]]
end
