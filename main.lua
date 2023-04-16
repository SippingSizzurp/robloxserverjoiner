local jobid = game.JobId
local gameid = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local player = game:GetService("Players").LocalPlayer

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


local function notifY()
    OrionLib:MakeNotification({
	Name = "LAUNCHING",
	Content = "3",
	Image = "rbxassetid://4483345998",
	Time = 1
    })
    wait(1)
    OrionLib:MakeNotification({
	Name = "LAUNCHING",
	Content = "2",
	Image = "rbxassetid://4483345998",
	Time = 1
    })
    wait(1)
    OrionLib:MakeNotification({
	Name = "LAUNCHING",
	Content = "1",
	Image = "rbxassetid://4483345998",
	Time = 1
    })
    wait(1)
end

local Window = OrionLib:MakeWindow({Name = "Server Joiner", HidePremium = true, SaveConfig = false, IntroText = "Server Joiner"})

tab = {}

tab.main = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://10481501007",
	PremiumOnly = false
})

tab.copy = Window:MakeTab({
	Name = "Copy",
	Icon = "rbxassetid://8471286247",
	PremiumOnly = false
})

tab.credits = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://8733216068",
	PremiumOnly = false
})

tab.credits:AddLabel("Made By: SippingSizzurp")

tab.copy:AddButton({
	Name = "Copy Place ID",
	Callback = function()
        setclipboard(game.PlaceId)
        OrionLib:MakeNotification({
        	Name = "PLACE ID COPIED",
        	Content = "",
        	Image = "rbxassetid://4485364377",
        	Time = 5
            })
  	end    
})

tab.copy:AddButton({
	Name = "Copy Job ID",
	Callback = function()
        setclipboard(game.JobId)
        OrionLib:MakeNotification({
        	Name = "JOB ID COPIED",
        	Content = "",
        	Image = "rbxassetid://4485364377",
        	Time = 5
            })
  	end    
})

tab.main:AddTextbox({
	Name = "Place ID",
	Default = gameid,
	TextDisappear = false,
	Callback = function(Value)
		gameid = Value
	end	  
})

tab.main:AddTextbox({
	Name = "Job ID",
	Default = jobid,
	TextDisappear = false,
	Callback = function(Value)
		jobid = Value
	end	  
})

tab.main:AddButton({
	Name = "Launch",
	Callback = function()
        notifY()
        local success, errorMessage = pcall(function()
        local teleportData = TeleportService:GetTeleportSetting("teleportData")
        TeleportService:TeleportToPlaceInstance(gameid, jobid, player)
        end)
        if not success then
            OrionLib:MakeNotification({
        	Name = "FAILED",
        	Content = errorMessage,
        	Image = "rbxassetid://4463096168",
        	Time = 5
            })
        end
  	end    
})


OrionLib:Init()
