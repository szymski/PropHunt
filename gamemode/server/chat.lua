util.AddNetworkString("WAPrint")
function SendChatMessage(...)
	local arg={...}
    net.Start("WAPrint")
        net.WriteTable(arg)
    net.Broadcast()
end