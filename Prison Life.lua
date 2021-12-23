
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Oreki's Scripts - Prison Life")

local serv = win:Server("Main", "")

local guns = serv:Channel("Guns")

guns:Button("Remington", function()
    local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP}
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

guns:Button("M9", function()
    local args = {[1] = workspace.Prison_ITEMS.giver.M9.ITEMPICKUP}
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

guns:Button("AK-47", function()
    local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
    local Event = game:GetService("Workspace").Remote.ItemHandler
    Event:InvokeServer(A_1)
end) 

local misc = serv:Channel("Misc")

misc:Button("Destroy all doors", function()
    game.Workspace.Doors:Destroy()
end)

misc:Button("Give Keycad", function()

    DiscordLib:Notification("Notification", "You MIGHT become police then you will go back to prisoner", "Okay")
        
    local OldPosition = nil

if game.workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
    game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
else
    OldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local NoCardFound = true
    while NoCardFound == true do
        game.workspace.Remote.TeamEvent:FireServer("Bright blue")
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        if game.workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            NoCardFound = false
            workspace.Remote.TeamEvent:FireServer("Bright orange")
            workspace.Remote.loadchar:InvokeServer(game.Players.LocalPlayer.Name)
            game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(OldPosition)
        end
    wait()
    end
end
end)

misc:Button("Escape", function()
    getgenv().autoescape = true
while wait() do 
    if getgenv().autoescape == true then
        if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright orange") then
              Crim = game.Workspace["Criminals Spawn"].SpawnLocation
        Crim.CanCollide = false
        Crim.Size = Vector3.new(51.05, 24.12, 54.76)
        Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        Crim.Transparency = 1
       wait()
        Crim.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Crim.Size = Vector3.new(6, 0.2, 6)
        Crim.Transparency = 0
        end
    end
    end
end)

misc:Button("Kill Aura", function()

    DiscordLib:Notification("Warning", "KillAura cant be disactivated, rejoin to put off.", "Okay")

    while wait () do
        for i, e in pairs(game.Players:GetChildren()) do
                              if e ~= game.Players.LocalPlayer then
                                  local meleeEvent = game:GetService("ReplicatedStorage").meleeEvent
                                  meleeEvent:FireServer(e)
                                  
                              end end end 
end)

local serv2 = win:Server("Extra", "")

local TpSection = serv2:Channel("Teleports")

TpSection:Button("Prison Yard", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798.999756, 95.1383057, 2540.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

TpSection:Button("Town", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-476.983185, 51.0750122, 1761.70032, -0.782586694, 0, -0.622541666, 0, 1, 0, 0.622541666, 0, -0.782586694)
end)

TpSection:Button("Criminal Hideout", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)
 
TpSection:Button("Police Spawn", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(857.08313, 97.1001282, 2302.84131, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local LocalPlayer = serv2:Channel("LocalPlayer")

LocalPlayer:Slider("WalkSpeed", 16, 200, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

LocalPlayer:Slider("Jump Power", 16, 200, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

local creds = serv2:Channel("Credits")

creds:Label("Made by Oreki#5328")
creds:Label("UI by dawid#7205")

creds:Button("Copy discord", function()
    DiscordLib:Notification("Notification", "Discord server will not been made til I make more scripts :)", "Okay")
end)
