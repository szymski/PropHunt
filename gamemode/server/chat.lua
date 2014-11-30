util.AddNetworkString("WAPrint")

function SendChatMessageToAll(...)
	local arg={...}
    net.Start("WAPrint")
        net.WriteTable(arg)
    net.Broadcast()
end

function SendChatMessage(ply,...)
	local arg={...}
    net.Start("WAPrint")
        net.WriteTable(arg)
    net.Send(ply)
end