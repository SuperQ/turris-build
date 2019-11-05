-- Fixes and hacks to migrate from older setups

-- ABI changed in libubus with version 2019-12-27
if not version_match or not installed or
		(installed["libubus"] and version_match(installed["libubus"].version, "<2019-12-27")) then
	Package("libubus", { abi_change = true })
end

-- Migrate orignal pkglists to separate config with options in place
if not version_match or not installed or
		(installed["pkglists"] and version_match(installed["pkglists"].version, "<1.3")) then
	Install("fix-pkglists-options")
	Package("fix-pkglists-options", { replan = "immediate" })
end
