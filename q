
 local EndName = {}
    for _,v in pairs(workspace.Areas.Body:GetChildren()) do
    if v.ClassName == "Folder" or  v.ClassName == "Model" then
        if v:FindFirstChild("Main") then
            table.insert(EndName, v.Name)
        end
    end
end

 local strName = {}
    for _,v in pairs(workspace.Areas.Strength:GetChildren()) do
    if v.ClassName == "Folder" or  v.ClassName == "Model" then
        if v:FindFirstChild("Main") then
            table.insert(strName, v.Name)
        end
    end
end



 local psyName = {}
    for _,v in pairs(workspace:WaitForChild("Areas").Psychic:GetChildren()) do
       if v.ClassName == "Folder" or  v.ClassName == "Model" then
        if v:FindFirstChild("Main") then
            table.insert(psyName, v.Name)
        end
    end
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mohamedyoo/owlhub/main/New%20ui"))()

local Window = Library.CreateLib("Super Power Masters X", "Midnight")

local Main = Window:NewTab("auto farm")

local Upgrade = Window:NewTab("auto Upgrade")

local Teleport = Window:NewTab("Teleports")

local Section = Main:NewSection("Main")

local UpS = Upgrade:NewSection("Select")

local ZoneS = Teleport:NewSection("training Zone")

 Section:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

ZoneS:NewDropdown("Teleport to training zone 'Endurance' ", "Endurance ONLY!!", EndName, function(Sele) -- drop down for multiple options that go under the same catagory, ex. Aimbone (Head, UpperTorso, Legs)
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Areas.Body:FindFirstChild(Sele):FindFirstChild("Main").Position)
    end)


         ZoneS:NewDropdown("Teleport to training zone 'Strength' ", "Strength ONLY!!", strName, function(Sele) -- drop down for multiple options that go under the same catagory, ex. Aimbone (Head, UpperTorso, Legs)
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Areas.Strength:FindFirstChild(Sele):FindFirstChild("Main").Position)
    end)
         ZoneS:NewDropdown("Teleport to training zone 'Psychic' ", "Psychic ONLY!!", psyName, function(Sele) -- drop down for multiple options that go under the same catagory, ex. Aimbone (Head, UpperTorso, Legs)
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Areas.Psychic:FindFirstChild(Sele):FindFirstChild("Main").Position)
    end)


 Section:NewToggle("Auto Rank up ", " ", function(v)
    getgenv().Rank = v
      while getgenv().Rank == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rank"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)

 Section:NewToggle("Auto Evo up ", " ", function(v)
    getgenv().Evo = v
      while getgenv().Evo == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Evolution"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)


Section:NewButton("Anti Afk", "ButtonInfo", function()
Library:Newnotify("Active" , "The anit afk was actived", 4)
loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()
end)

UpS:NewToggle("auto upgrade endurence", "Make your player auto click", function(v)
    getgenv().Uend = v
      while getgenv().Uend == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Body"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)
 
UpS:NewToggle("auto upgrade strength", "Make your player auto click", function(v)
    getgenv().Ustr = v
      while getgenv().Ustr == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Strength"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)
 
UpS:NewToggle("auto upgrade speed", "Make your player auto click", function(v)
    getgenv().USp = v
      while getgenv().USp == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Speed"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)

Section:NewButton("rune 2 ", "ButtonInfo", function()
local args = {
    [1] = false
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Runes"):WaitForChild("Rune2"):FireServer(unpack(args))
end)

Section:NewToggle("Auto Rune 2", "Make your player auto click", function(v)
    getgenv().E1 = v
      while getgenv().E1 == true do
local args = {
    [1] = false
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Runes"):WaitForChild("Rune2"):FireServer(unpack(args))

game:GetService("RunService").Heartbeat:wait();
  end
   end)

Section:NewToggle("Auto Rune 1 sec", "Make your player auto click", function(v)
    getgenv().S1 = v
      while getgenv().S1 == true do
local args = {
    [1] = game:GetService("Players").LocalPlayer
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Runes"):WaitForChild("SecretRune"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end) 

Section:NewToggle("Auto Rune 1 secret", "Make your player auto click", function(v)
    getgenv().Se1 = v
      while getgenv().Se1 == true do 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Runes"):WaitForChild("SecretRune"):FireServer()
game:GetService("RunService").Heartbeat:wait();
  end
   end)


Section:NewButton("Join lowest server", "ButtonInfo", function()
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"
 
local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end
 
local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server
 
TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end)
