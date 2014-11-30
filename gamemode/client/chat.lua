 net.Receive("WAPrint", function()
    chat.AddText(unpack(net.ReadTable()))
end)