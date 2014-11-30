util.AddNetworkString("WAPrint")
function SendChatMessage(...)
    net.Start("WAPrint")
        net.WriteTable(arg)
    net.Broadcast()
end