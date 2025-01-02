local Library = loadstring(game:HttpGet("https://you.whimper.xyz/sources/btteam/SystemUI.lua"))() -- LIBRARY

local Window = Library:CreateWindow('BLACKTRAP') -- CREATE WINDOW

local Tab = { -- CREATE TABS
    Tab_1 = Window:addTab('#Home'),
    Tab_Setting = Window:addTab('#Settings'),
    Tab_2 = Window:addTab('#Main Farm'),
    Tab_SubFarm = Window:addTab('#Subs Farm'),
    Tab_3 = Window:addTab('#Quest'),
    Tab_Sea = Window:addTab('#Sea Event'),
    Tab_RaceV4 = Window:addTab('#Race V4'),
    Tab_4 = Window:addTab('#Raids'),
    Tab_Combat = Window:addTab('#PVP'),
    Tab_5 = Window:addTab('#Teleport & Status'),
    Tab_6 = Window:addTab('#Shop'),
    Tab_7 = Window:addTab('#Misc')
    
}

local Home_Left = Tab.Tab_1:addSection() -- HOME LEFT SECTION
local Changelog = Home_Left:addMenu("#Changelog")
Changelog:addChangelog('[April, 06 2024]')
Changelog:addChangelog('- Added Webhook Notifier to Discord')
Changelog:addChangelog('- Added Subs Farming')
Changelog:addChangelog('- Added New Method Mastery Farm')
Changelog:addChangelog('- Added Pirate Raid Castle')
Changelog:addChangelog('- Added Mirage Island Feature')
Changelog:addChangelog('- Added Kitsune Island Feature')
Changelog:addChangelog('- Added PVP Feature')
Changelog:addChangelog('- Added Fruit Notifier (Shop-Devil Fruit)')
Changelog:addChangelog('- Fixed Auto Store Fruit')
Changelog:addChangelog('- Fixed All ESP')
Changelog:addChangelog('- Fixed Gun Mastery Skill')
Changelog:addChangelog('- Changed some function.')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 19 2023]')
Changelog:addChangelog('- Sea Event Menu (Beta)')
Changelog:addChangelog('- Fixed 1st World Farm Lv 375 - 525')
Changelog:addChangelog('- Fixed 2nd World Farm Lv 1250 - 1375')
Changelog:addChangelog('- Fixed Raid Chip Buy')
Changelog:addChangelog('- Change Button to Toggle for Auto Raid')
Changelog:addChangelog('- Fixed Chest Farm')
Changelog:addChangelog('- Fixed Auto Dough King')
Changelog:addChangelog('- Fixed Auto Buy Fruit on Shop')
Changelog:addChangelog('')
Changelog:addChangelog('[November, 11 2023]')
Changelog:addChangelog('- Fixed Auto Farm Level')
Changelog:addChangelog('- Fixed Observation Farm')
Changelog:addChangelog('- Fixed Dough King Farm')
Changelog:addChangelog('')
Changelog:addChangelog('[October, 30 2023 - UPDATE 20]')
Changelog:addChangelog('- Fixed Mobs Index Farm')
Changelog:addChangelog('')
Changelog:addChangelog("[October, 25 2023 - UPDATE 20]")
Changelog:addChangelog('- Added Quest List')
Changelog:addChangelog('- Fast Attack Default Changed')
Changelog:addChangelog('- Fixed some minor bugs')
Changelog:addChangelog('')
Changelog:addChangelog("[October, 23 2023 - UPDATE 20]")
Changelog:addChangelog('- Changed UI')
Changelog:addChangelog('- New Level Farm')
Changelog:addChangelog('- Improve Farm')
Changelog:addChangelog('- Fixed Some bug issued')

local Home_Right = Tab.Tab_1:addSection() -- HOME RIGHT SECTION
local Main_Home = Home_Right:addMenu("#Home")

getgenv().WalkSpeedValue = 26
Main_Home:addTextbox("Speed Hack", getgenv().WalkSpeedValue, function(speedfunc)
    getgenv().WalkSpeedValue = speedfunc
    if getgenv().WalkSpeedValue then
        local Player = game:service'Players'.LocalPlayer
        Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
            Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)

getgenv().JumpValue = 50
Main_Home:addTextbox("Jump Hack", getgenv().JumpValue, function(jumpfunc)
    getgenv().JumpValue = jumpfunc
    if getgenv().JumpValue then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)

Main_Home:addToggle("Infinite Jump", InfiniteJumpEnabled, function(Value)
    InfiniteJumpEnabled = Value
    if InfiniteJumpEnabled then
        game:GetService("UserInputService").JumpRequest:connect(function()
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end)
    end
end)

Main_Home:addToggle('No Clip', getgenv().NoClip, function(clipf)
    getgenv().NoClip = clipf
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

getgenv().AntiAFK = true
Main_Home:addToggle("Anti AFK", getgenv().AntiAFK, function(Value)
    getgenv().AntiAFK = Value
end)

task.spawn(function ()
    while wait(.1) do
        if getgenv().AntiAFK then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)

getgenv().AntiKickClient = true
Main_Home:addToggle("Anti Kick Client", getgenv().AntiKickClient, function(Value)
    getgenv().AntiKickClient = Value
end)
task.spawn(function()
    while wait() do
        if getgenv().AntiKickClient then
            loadstring(game:HttpGet('https://gitlab.com/Sky2836/BT/-/raw/main/antikickclient'))()
        end
    end
end)

Main_Home:addButton("FPS Boost", function()
    local decalsyeeted = false
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

Main_Home:addButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Main_Home:addButton("Server Hop", function()
    Hop()
end)
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(.1)
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(.1)
                end
            end
        end
    end
    function Teleport() 
        while wait(.1) do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

Main_Home:addButton("Teleport To Lower Server", function()
    local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    if not _G.FailedServerID then _G.FailedServerID = {} end

    local function serversearch()
        data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
        for _, v in pairs(data_table.data) do
            pcall(function()
                if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end)
        end
    end

    function getservers()
        pcall(serversearch)
        for i, v in pairs(data_table) do
            if i == "nextPageCursor" then
                if gamelink:find"&cursor=" then
                    local a = gamelink:find"&cursor="
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" .. v
                pcall(getservers)
            end
        end
    end

    pcall(getservers)
    wait(.1)
    if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
    end
    table.insert(_G.FailedServerID, goodserver)
    game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)

    while wait(.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
                if GUI then
                    if GUI.TitleFrame.ErrorTitle.Text == "Disconnected" then
                        if #game.Players:GetPlayers() <= 1 then
                            game.Players.LocalPlayer:Kick("\nRejoining...")
                            wait(.1)
                            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                        else
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                        end
                    end
                end
            end)
        end)
    end
end)

Main_Home:addButton("Destroy GUI", function()
    Library:DestroyGui()
end)

----------------------------------------------------//----------------------------------------------------
--// PATH 
--[[wait(1)
loadstring(game:HttpGet('https://raw.githubusercontent.com/S4nZz/bt_project/main/script'))() ]]

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if _G.Team == "Pirate" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            elseif _G.Team == "Marine" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            else
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end

--// World Check
First_Sea = false
Second_Sea = false
Third_Sea = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    First_Sea = true
elseif placeId == 4442272183 then
    Second_Sea = true
elseif placeId == 7449423635 then
    Third_Sea = true
end

--// CHECK MONSTER
function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if First_Sea then
        if Lv == 1 or Lv <= 9 or _G.SelectMonster == "Bandit [Lv. 5]" then -- Bandit
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif Lv == 10 or Lv <= 14 or _G.SelectMonster == "Monkey [Lv. 14]" then -- Monkey
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif Lv == 15 or Lv <= 29 or _G.SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif Lv == 30 or Lv <= 39 or _G.SelectMonster == "Pirate [Lv. 35]" then -- Pirate
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif Lv == 40 or Lv <= 59 or _G.SelectMonster == "Brute [Lv. 45]" then -- Brute
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif Lv == 60 or Lv <= 74 or _G.SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif Lv == 75 or Lv <= 89 or _G.SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif Lv == 90 or Lv <= 99 or _G.SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif Lv == 100 or Lv <= 119 or _G.SelectMonster == "Snowman [Lv. 100]" then -- Snowman
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lv == 120 or Lv <= 149 or _G.SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif Lv == 150 or Lv <= 174 or _G.SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 189 or _G.SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif Lv == 190 or Lv <= 209 or _G.SelectMonster == "Prisoner [Lv. 190]" then -- Prisoner
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif Lv == 210 or Lv <= 249 or _G.SelectMonster == "Dangerous Prisoner [Lv. 210]" then -- Dangerous Prisoner
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif Lv == 250 or Lv <= 274 or _G.SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or _G.SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif Lv == 300 or Lv <= 324 or _G.SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif Lv == 325 or Lv <= 374 or _G.SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif Lv == 375 or Lv <= 399 or _G.SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 400 or Lv <= 449 or _G.SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 450 or Lv <= 474 or _G.SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif Lv == 475 or Lv <= 524 or _G.SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif Lv == 525 or Lv <= 549 or _G.SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or _G.SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or _G.SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or _G.SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Second_Sea then
        if Lv == 700 or Lv <= 724 or _G.SelectMonster == "Raider [Lv. 700]" then -- Raider
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif Lv == 725 or Lv <= 774 or _G.SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif Lv == 775 or Lv <= 799 or _G.SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif Lv == 800 or Lv <= 874 or _G.SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif Lv == 875 or Lv <= 899 or _G.SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif Lv == 900 or Lv <= 949 or _G.SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif Lv == 950 or Lv <= 974 or _G.SelectMonster == "Zombie [Lv. 950]" then -- Zombie
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or _G.SelectMonster == "Vampire [Lv. 975]" then -- Vampire
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif Lv == 1000 or Lv <= 1049 or _G.SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or _G.SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or _G.SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif Lv == 1125 or Lv <= 1174 or _G.SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif Lv == 1175 or Lv <= 1199 or _G.SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or _G.SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or _G.SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1275 or Lv <= 1299 or _G.SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1300 or Lv <= 1324 or _G.SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1325 or Lv <= 1349 or _G.SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1350 or Lv <= 1374 or _G.SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif Lv == 1375 or Lv <= 1424 or _G.SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or _G.SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or _G.SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    end
    if Third_Sea then
        if Lv == 1500 or Lv <= 1524 or _G.SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
        elseif Lv == 1525 or Lv <= 1574 or _G.SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
        elseif Lv == 1575 or Lv <= 1599 or _G.SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
            Ms = "Dragon Crew Warrior"
            NameQuest = "AmazonQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
        elseif Lv == 1600 or Lv <= 1624 or _G.SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
            Ms = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
        elseif Lv == 1625 or Lv <= 1649 or _G.SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
            Ms = "Female Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 1
            NameMon = "Female Islander"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
        elseif Lv == 1650 or Lv <= 1699 or _G.SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
            Ms = "Giant Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 2
            NameMon = "Giant Islander"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
        elseif Lv == 1700 or Lv <= 1724 or _G.SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif Lv == 1725 or Lv <= 1774 or _G.SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif Lv == 1775 or Lv <= 1799 or _G.SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif Lv == 1800 or Lv <= 1824 or _G.SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif Lv == 1825 or Lv <= 1849 or _G.SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif Lv == 1850 or Lv <= 1899 or _G.SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif Lv == 1900 or Lv <= 1924 or _G.SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif Lv == 1925 or Lv <= 1974 or _G.SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif Lv == 1975 or Lv <= 1999 or _G.SelectMonster == "Reborn Skeleton [Lv. 1975]" then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
        elseif Lv == 2000 or Lv <= 2024 or _G.SelectMonster == "Living Zombie [Lv. 2000]" then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
        elseif Lv == 2025 or Lv <= 2049 or _G.SelectMonster == "Demonic Soul [Lv. 2025]" then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif Lv == 2050 or Lv <= 2074 or _G.SelectMonster == "Posessed Mummy [Lv. 2050]" then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif Lv == 2075 or Lv <= 2099 or _G.SelectMonster == "Peanut Scout [Lv. 2075]" then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif Lv == 2100 or Lv <= 2124 or _G.SelectMonster == "Peanut President [Lv. 2100]" then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif Lv == 2125 or Lv <= 2149 or _G.SelectMonster == "Ice Cream Chef [Lv. 2125]" then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif Lv == 2150 or Lv <= 2199 or _G.SelectMonster == "Ice Cream Commander [Lv. 2150]" then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif Lv == 2200 or Lv <= 2224 or _G.SelectMonster == "Cookie Crafter [Lv. 2200]" then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
        elseif Lv == 2225 or Lv <= 2249 or _G.SelectMonster == "Cake Guard [Lv. 2225]" then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
        elseif Lv == 2250 or Lv <= 2274 or _G.SelectMonster == "Baking Staff [Lv. 2250]" then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
        elseif Lv == 2275 or Lv <= 2299 or _G.SelectMonster == "Head Baker [Lv. 2275]" then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
        elseif Lv == 2300 or Lv <= 2324 or _G.SelectMonster == "Cocoa Warrior [Lv. 2300]" then
            Ms = "Cocoa Warrior"
            NameQuest ="ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
        elseif Lv == 2325 or Lv <= 2349 or _G.SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
        elseif Lv == 2350 or Lv <= 2374 or _G.SelectMonster == "Sweet Thief [Lv. 2350]" then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
        elseif Lv == 2375 or Lv <= 2400 or _G.SelectMonster == "Candy Rebel [Lv. 2375]" then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
        elseif Lv == 2400 or Lv <= 2424 or _G.SelectMonster == "Candy Pirate [Lv. 2400]" then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
        elseif Lv == 2425 or Lv <= 2449 or _G.SelectMonster == "Snow Demon [Lv. 2425]" then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

        elseif Lv == 2450 or Lv <= 2474 or _G.SelectMonster == "Isle Outlaw [Lv. 2450]" then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16122.4062, 10.6328173, -257.351685, -0.630029082, 0, 0.776571631, 0, 1, 0, -0.776571631, 0, -0.630029082)
        elseif Lv == 2475 or Lv <= 2499 or _G.SelectMonster == "Island Boy [2475]" then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16736.2266, 20.533947, -131.718811, 0.546393692, 0, 0.837528467, 0, 1, 0, -0.837528467, 0, 0.546393692)
        elseif Lv == 2500 or Lv <= 2524 or _G.SelectMonster == "Sun-kissed Warrior [Lv. 2500]" then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-"
            CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065)
            CFrameMon = CFrame.new(-16413.5078, 54.6350479, 1054.43555, -0.999391913, 0, -0.034868788, 0, 1, 0, 0.034868788, 0, -0.999391913)
        elseif Lv >= 2525 or _G.SelectMonster == "Isle Champion [Lv. 2525]" then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065)
            CFrameMon = CFrame.new(-16787.3203, 20.6350517, 992.131836, -0.775471091, 0, 0.631383121, 0, 1, 0, -0.631383121, 0, -0.775471091)
        end
    end
end

--// Select Monster
if First_Sea then
    tableMon = {"Bandit [Lv. 5]","Monkey [Lv. 14]","Gorilla [Lv. 20]","Pirate [Lv. 35]","Brute [Lv. 45]","Desert Bandit [Lv. 60]","Desert Officer [Lv. 70]","Snow Bandit [Lv. 90]","Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]","Sky Bandit [Lv. 150]","Dark Master [Lv. 175]","Prisoner [Lv. 190]", "Dangerous Prisoner [Lv. 210]","Toga Warrior [Lv. 250]","Gladiator [Lv. 275]","Military Soldier [Lv. 300]","Military Spy [Lv. 325]","Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]","God's Guard [Lv. 450]","Shanda [Lv. 475]","Royal Squad [Lv. 525]","Royal Soldier [Lv. 550]","Galley Pirate [Lv. 625]","Galley Captain [Lv. 650]"}
elseif Second_Sea then
    tableMon = {"Raider [Lv. 700]","Mercenary [Lv. 725]","Swan Pirate [Lv. 775]","Factory Staff [Lv. 800]","Marine Lieutenant [Lv. 875]","Marine Captain [Lv. 900]","Zombie [Lv. 950]","Vampire [Lv. 975]","Snow Trooper [Lv. 1000]","Winter Warrior [Lv. 1050]","Lab Subordinate [Lv. 1100]","Horned Warrior [Lv. 1125]","Magma Ninja [Lv. 1175]","Lava Pirate [Lv. 1200]","Ship Deckhand [Lv. 1250]","Ship Engineer [Lv. 1275]","Ship Steward [Lv. 1300]","Ship Officer [Lv. 1325]","Arctic Warrior [Lv. 1350]","Snow Lurker [Lv. 1375]","Sea Soldier [Lv. 1425]","Water Fighter [Lv. 1450]"}
elseif Third_Sea then
    tableMon = {"Pirate Millionaire [Lv. 1500]","Dragon Crew Warrior [Lv. 1575]","Dragon Crew Archer [Lv. 1600]","Female Islander [Lv. 1625]","Giant Islander [Lv. 1650]","Marine Commodore [Lv. 1700]","Marine Rear Admiral [Lv. 1725]","Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]","Forest Pirate [Lv. 1825]","Mythological Pirate [Lv. 1850]","Jungle Pirate [Lv. 1900]","Musketeer Pirate [Lv. 1925]","Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]", "Peanut Scout [Lv. 2075]", "Peanut President [Lv. 2100]", "Ice Cream Chef [Lv. 2125]", "Ice Cream Commander [Lv. 2150]", "Cookie Crafter [Lv. 2200]", "Cake Guard [Lv. 2225]", "Baking Staff [Lv. 2250]", "Head Baker [Lv. 2275]", "Cocoa Warrior [Lv. 2300]", "Chocolate Bar Battler [Lv. 2325]", "Sweet Thief [Lv. 2350]", "Candy Rebel [Lv. 2375]", "Candy Pirate [Lv. 2400]", "Snow Demon [Lv. 2425]",
        "Isle Outlaw [Lv. 2450]", "Island Boy [2475]", "Sun-kissed Warrior [Lv. 2500]", "Isle Champion [Lv. 2525]"
    }
end

--// Check Boss Quest
function CheckBossQuest()
    if First_Sea then
        if SelectBoss == "The Gorilla King" then
            BossMon = "The Gorilla King [Lv. 25] [Boss]"
            NameBoss = 'The Gorrila King'
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        elseif SelectBoss == "Bobby" then
            BossMon = "Bobby [Lv. 55] [Boss]"
            NameBoss = 'Bobby'
            NameQuestBoss = "BuggyQuest1"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$8,000\n35,000 Exp."
            CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif SelectBoss == "The Saw" then
            BossMon = "The Saw [Lv. 100] [Boss]"
            NameBoss = 'The Saw'
            CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif SelectBoss == "Yeti" then
            BossMon = "Yeti [Lv. 110] [Boss]"
            NameBoss = 'Yeti'
            NameQuestBoss = "SnowQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif SelectBoss == "Mob Leader" then
            BossMon = "Mob Leader [Lv. 120] [Boss]"
            NameBoss = 'Mob Leader'
            CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
        elseif SelectBoss == "Vice Admiral" then
            BossMon = "Vice Admiral [Lv. 130] [Boss]"
            NameBoss = 'Vice Admiral'
            NameQuestBoss = "MarineQuest2"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif SelectBoss == "Saber Expert" then
            NameBoss = 'Saber Expert'
            BossMon = "Saber Expert [Lv. 200] [Boss]"
            CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        elseif SelectBoss == "Warden" then
            BossMon = "Warden [Lv. 220] [Boss]"
            NameBoss = 'Warden'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 1
            RewardBoss = "Reward:\n$6,000\n850,000 Exp."
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
            CFrameQBoss= CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Chief Warden" then
            BossMon = "Chief Warden [Lv. 230] [Boss]"
            NameBoss = 'Chief Warden'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Swan" then
            BossMon = "Swan [Lv. 240] [Boss]"
            NameBoss = 'Swan'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Magma Admiral" then
            BossMon = "Magma Admiral [Lv. 350] [Boss]"
            NameBoss = 'Magma Admiral'
            NameQuestBoss = "MagmaQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
            CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
        elseif SelectBoss == "Fishman Lord" then
            BossMon = "Fishman Lord [Lv. 425] [Boss]"
            NameBoss = 'Fishman Lord'
            NameQuestBoss = "FishmanQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
        elseif SelectBoss == "Wysper" then
            BossMon = "Wysper [Lv. 500] [Boss]"
            NameBoss = 'Wysper'
            NameQuestBoss = "SkyExp1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
            CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
        elseif SelectBoss == "Thunder God" then
            BossMon = "Thunder God [Lv. 575] [Boss]"
            NameBoss = 'Thunder God'
            NameQuestBoss = "SkyExp2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
            CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
        elseif SelectBoss == "Cyborg" then
            BossMon = "Cyborg [Lv. 675] [Boss]"
            NameBoss = 'Cyborg'
            NameQuestBoss = "FountainQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
        elseif SelectBoss == "Ice Admiral" then
            BossMon = "Ice Admiral [Lv. 700] [Boss]"
            NameBoss = 'Ice Admiral'
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
        elseif SelectBoss == "Greybeard" then
            BossMon = "Greybeard [Lv. 750] [Raid Boss]"
            NameBoss = 'Greybeard'
            CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
        end
    end
    if Second_Sea then
        if SelectBoss == "Diamond" then
            BossMon = "Diamond [Lv. 750] [Boss]"
            NameBoss = 'Diamond'
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
            CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        elseif SelectBoss == "Jeremy" then
            BossMon = "Jeremy [Lv. 850] [Boss]"
            NameBoss = 'Jeremy'
            NameQuestBoss = "Area2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
        elseif SelectBoss == "Fajita" then
            BossMon = "Fajita [Lv. 925] [Boss]"
            NameBoss = 'Fajita'
            NameQuestBoss = "MarineQuest3"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
            CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
        elseif SelectBoss == "Don Swan" then
            BossMon = "Don Swan [Lv. 1000] [Boss]"
            NameBoss = 'Don Swan'
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
        elseif SelectBoss == "Smoke Admiral" then
            BossMon = "Smoke Admiral [Lv. 1150] [Boss]"
            NameBoss = 'Smoke Admiral'
            NameQuestBoss = "IceSideQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
            CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
        elseif SelectBoss == "Awakened Ice Admiral" then
            BossMon = "Awakened Ice Admiral [Lv. 1400] [Boss]"
            NameBoss = 'Awakened Ice Admiral'
            NameQuestBoss = "FrostQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
        elseif SelectBoss == "Tide Keeper" then
            BossMon = "Tide Keeper [Lv. 1475] [Boss]"
            NameBoss = 'Tide Keeper'
            NameQuestBoss = "ForgottenQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
            CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
        elseif SelectBoss == "Darkbeard" then
            BossMon = "Darkbeard [Lv. 1000] [Raid Boss]"
            NameBoss = 'Darkbeard'
            CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
        elseif SelectBoss == "Cursed Captain" then
            BossMon = "Cursed Captain [Lv. 1325] [Raid Boss]"
            NameBoss = 'Cursed Captain'
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
        elseif SelectBoss == "Order" then
            BossMon = "Order [Lv. 1250] [Raid Boss]"
            NameBoss = 'Order'
            CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
        end
    end
    if Third_Sea then
        if SelectBoss == "Stone" then
            BossMon = "Stone [Lv. 1550] [Boss]"
            NameBoss = 'Stone'
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif SelectBoss == "Island Empress" then
            BossMon = "Island Empress [Lv. 1675] [Boss]"
            NameBoss = 'Island Empress'
            NameQuestBoss = "AmazonQuest2"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
            CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
            CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
        elseif SelectBoss == "Kilo Admiral" then
            BossMon = "Kilo Admiral [Lv. 1750] [Boss]"
            NameBoss = 'Kilo Admiral'
            NameQuestBoss = "MarineTreeIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        elseif SelectBoss == "Captain Elephant" then
            BossMon = "Captain Elephant [Lv. 1875] [Boss]"
            NameBoss = 'Captain Elephant'
            NameQuestBoss = "DeepForestIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
            CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
        elseif SelectBoss == "Beautiful Pirate" then
            BossMon = "Beautiful Pirate [Lv. 1950] [Boss]"
            NameBoss = 'Beautiful Pirate'
            NameQuestBoss = "DeepForestIsland2"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
            CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
        elseif SelectBoss == "Cake Queen" then
            BossMon = "Cake Queen [Lv. 2175] [Boss]"
            NameBoss = 'Cake Queen'
            NameQuestBoss = "IceCreamIslandQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
            CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
        elseif SelectBoss == "Longma" then
            BossMon = "Longma [Lv. 2000] [Boss]"
            NameBoss = 'Longma'
            CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
        elseif SelectBoss == "Soul Reaper" then
            BossMon = "Soul Reaper [Lv. 2100] [Raid Boss]"
            NameBoss = 'Soul Reaper'
            CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
        elseif SelectBoss == "rip_indra True Form" then
            BossMon = "rip_indra True Form [Lv. 5000] [Raid Boss]"
            NameBoss = 'rip_indra True Form'
            CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
        end
    end
end

--// Check Material
function MaterialMon()
    if SelectMaterial == "Radioactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(295,73,-56)
        SP = "Default"
    elseif SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter"
        MPos = CFrame.new(-3385,239,-10542)
        SP = "Default"
    elseif SelectMaterial == "Magma Ore" then
        if First_Sea then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815,84,8820)
            SP = "Default"
        elseif Second_Sea then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428,78,-5959)
            SP = "Default"
        end
    elseif SelectMaterial == "Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698,845,-1912)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
        end
    elseif SelectMaterial == "Leather" then
        if First_Sea then
            MMon = "Brute"
            MPos = CFrame.new(-1145,15,4350)
            SP = "Default"
        elseif Second_Sea then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Default"
        elseif Third_Sea then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "Default"
        end
    elseif SelectMaterial == "Scrap Metal" then
        if First_Sea then
            MMon = "Brute"
            MPos = CFrame.new(-1145,15,4350)
            SP = "Default"
        elseif Second_Sea then
            MMon = "Swan Pirate"
            MPos = CFrame.new(878,122,1235)
            SP = "Default"
        elseif Third_Sea then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107,332,-10549)
            SP = "Default"
        end
    elseif SelectMaterial == "Fish Tail" then
        if Third_Sea then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10993,332,-8940)
            SP = "Default"
        elseif First_Sea then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(61123,19,1569)
            SP = "Default"
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
            end
        end
    elseif SelectMaterial == "Demonic Wisp" then
        MMon = "Demonic Soul"
        MPos = CFrame.new(-9507,172,6158)
        SP = "Default"
    elseif SelectMaterial == "Vampire Fang" then
        MMon = "Vampire"
        MPos = CFrame.new(-6033,7,-1317)
        SP = "Default"
    elseif SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"
        MPos = CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625)
        SP = "Default"
    elseif SelectMaterial == "Dragon Scale" then
        MMon = "Dragon Crew Archer"
        MPos = CFrame.new(6594,383,139)
        SP = "Default"
    elseif SelectMaterial == "Gunpowder" then
        MMon = "Pistol Billionaire"
        MPos = CFrame.new(-469,74,5904)
        SP = "Default"
    elseif SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate"
        MPos = CFrame.new(-13545,470,-6917)
        SP = "Default"
    end
end



--// Bypass
--[[function BypassCheck()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game:GetService('Workspace'):GetChildren()) do
        if v.Name == "Script" then
            v:Destroy()
        end
    end
end
BypassCheck()]]

--// EQUIP WEAPON 
function EquipTool(Tool)
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[Tool])
    end)
end

--// TWEEN PLAYER
function Tween(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance > 1 then
        Speed = 350
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1}):Play()
end

--// TP ISLAND
function TP2(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance > 1 then
        Speed = 350
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1}):Play()
    if _G.StopTween2 then
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1}):Cancel()
    end
    _G.Clip2 = true
    wait(Distance/Speed)
    _G.Clip2 = false
end

--// CANCEL TWEEN
function CancelTween(target)
    if not target then
        _G.StopTween = true
        wait(.1)
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait(.1)
        _G.StopTween = false
    end
end

--// Bypass Teleport
function BTP(Tarpos)
    if (Tarpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
        game.Players.LocalPlayer.Character.Head:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tarpos
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tarpos
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        wait(7)
    elseif (Tarpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
        Tween(Tarpos)
    end
end

--// AUTO CLICK
function AutoClick()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end

--// Player Body Velocity
spawn(function()
    while wait() do
        pcall(function()
            if TeleporttoFruitDealer or _G.TeleportFruit or TeleporttoKitsune or CollectAzureAmber or AutoTrain or AutoKillHuman or AutoPirateCastle or TweenToPlayer or AutoSail or AutoFarmTerrorShark or AutoFarmFish or AutoFarmSeaBeast or AutoFarmGhostBoats or LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmBossNoQuest or AutoFarmBossQuest or GunMastery_Farm or DevilMastery_Farm or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

--// Farming Clip Tween
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if TeleporttoFruitDealer or _G.TeleportFruit or TeleporttoKitsune or CollectAzureAmber or AutoTrain or AutoKillHuman or AutoPirateCastle or TweenToPlayer or AutoSail or AutoFarmTerrorShark or AutoFarmFish or AutoFarmSeaBeast or AutoFarmGhostBoats or LevelFarmNoQuest or LevelFarmQuest or Farm_Bone or Farm_Ectoplasm or Nearest_Farm or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or Auto_Farm_Material or AutoFarmBossNoQuest or AutoFarmBossQuest or GunMastery_Farm or DevilMastery_Farm or AutoKenV2 or AutoFarmKen or AutoNextIsland or BossRaid or _G.Teleport_to_Player or _G.Clip or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or TeleporttoMirage or TeleporttoGear or _G.Auto_Teleport_Fruit or AutoSecondWorld or AutoThirdWorld or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoSaber or AutoRengoku or AutoBuddySword or AutoPole or AutoYama or AutoCavander or AutoTushita or Auto_Cursed_Dual_Katana or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoEliteHunter or AutoCakePrince or _G.AutoDoughKing or AutoDarkDagger or AutoHallowSycthe or AutoCitizen or AutoEvoRace or AutoBartilo or AutoFactory or _G.SwanGlasses or RipIndra or AutoRainbowHaki or AutoTorch or AutoSoulGuitar or AutoTryLuck or AutoPray or AutoAdvanceDungeon or AutoMusketeer or Auto_Serpent_Bow then
                for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

----------------------------------------------------//----------------------------------------------------

--// SETTING ELFT
local Setting_Left = Tab.Tab_Setting:addSection()
local Main_Setting = Setting_Left:addMenu('#Main Setting')

local WeaponList = {"Melee","Blox Fruit","Sword","Gun"}
SelectWeaponFarm = "Melee"
Main_Setting:addDropdown("Select Weapon", SelectWeaponFarm, WeaponList,function(weaponfunc)
    SelectWeaponFarm = weaponfunc
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if SelectWeaponFarm == "Melee" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeapon = v.Name
                        end
                    end
                end
            elseif SelectWeaponFarm == "Sword" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeapon = v.Name
                        end
                    end
                end
            elseif SelectWeaponFarm == "Blox Fruit" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeapon = v.Name
                        end
                    end
                end
            elseif SelectWeaponFarm == "Gun" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeapon = v.Name
                        end
                    end
                end
            end
        end)
    end
end)

--// Farm Mode
local FarmTable = {
    "Above",
    "Beside"
}
AutoFarmType = "Above"
Main_Setting:addDropdown("Select Farm Type", AutoFarmType, FarmTable, function(Value)
    AutoFarmType = Value
end)
spawn(function()
    while wait() do
        if AutoFarmType == "Above" then
            Farm_Mode = CFrame.new(0,DisFarm,0) * CFrame.Angles(math.rad(-90),0,0)
        elseif AutoFarmType == "Beside" then
            Farm_Mode = CFrame.new(0,2,DisFarm) * CFrame.Angles(math.rad(0),0,0)
        end
    end
end)

DisFarm = 30
Main_Setting:addTextbox("Distance Farm", DisFarm, function(Value)
    DisFarm = Value
end)

local AttackList = {"0.100 (Risk)", "0.165", "0.175 (Default)", "0.185", "0.200", "0.300", "0.500", "0.700 (Slow)"}

FastAttackSelected = "0.175 (Default)"
Main_Setting:addDropdown("Fast Attack Delay", FastAttackSelected, AttackList, function(Value)
    FastAttackSelected = Value
end)

spawn(function()
    while task.wait() do
        if FastAttackSelected == "0.100 (Risk)" then
            FastAttackDelay = 0.1
        elseif FastAttackSelected == "0.165" then
            FastAttackDelay = 0.165
        elseif FastAttackSelected == "0.175 (Default)" then
            FastAttackDelay = 0.175
        elseif FastAttackSelected == "0.185" then
            FastAttackDelay = 0.185
        elseif FastAttackSelected == "0.200" then
            FastAttackDelay = 0.2
        elseif FastAttackSelected == "0.300" then
            FastAttackDelay = 0.3
        elseif FastAttackSelected == "0.500" then
            FastAttackDelay = 0.5
        elseif FastAttackSelected == "0.700 (Slow)" then
            FastAttackDelay = 0.7
        end
    end
end)

--// Fast Attack
local CombatFramework = require(game:GetService('Players').LocalPlayer.PlayerScripts.CombatFramework)

function GetCurrentBlade()
    local GetFastAttack = debug.getupvalues(CombatFramework)[2]
    local activeController = GetFastAttack.activeController
    local blades = activeController.blades[1]
    if not blades then return end
    while blades.Parent ~= game.Players.LocalPlayer.Character do blades = blades.Parent end
    return blades
end

function AttackNoCD()
    local plr = game:GetService("Players").LocalPlayer
    local GetFastAttack = debug.getupvalues(CombatFramework)[2]
    local activeController = GetFastAttack.activeController
    for i = 1, 1 do
        local getBladeHits = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
        local cac = {}
        local hash = {}
        for k, v in pairs(getBladeHits) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        getBladeHits = cac
        if #getBladeHits > 0 then
            local u8 = debug.getupvalue(activeController.attack, 5)
            local u9 = debug.getupvalue(activeController.attack, 6)
            local u7 = debug.getupvalue(activeController.attack, 4)
            local u10 = debug.getupvalue(activeController.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
            u10 = u10 + 1
            debug.setupvalue(activeController.attack, 5, u8)
            debug.setupvalue(activeController.attack, 6, u9)
            debug.setupvalue(activeController.attack, 4, u7)
            debug.setupvalue(activeController.attack, 7, u10)

            pcall(function()
                if plr.Character:FindFirstChildOfClass("Tool") and activeController.blades and activeController.blades[1] then
                    activeController.animator.anims.basic[1]:Play(0.01,0.01,0.01)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getBladeHits, i, "")
                end
            end)
        end
    end
end

local FastAttack = true
Main_Setting:addToggle('Fast Attack 1 (Selected Delay)', FastAttack, function(Value)
    FastAttack = Value
end)
spawn(function()
    while task.wait() do
        if FastAttack then
            local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
            CameraShakerR:Stop()

            pcall(function()
                repeat task.wait(FastAttackDelay)
                    AttackNoCD()
                until not FastAttack
            end)
        end
    end
end)

Main_Setting:addToggle('Fast Attack 2 (Without Selected Delay)', MobileFastAttack, function(Value)
    MobileFastAttack = Value
end)
spawn(function()
    while task.wait() do
        if MobileFastAttack then
            local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
            CameraShakerR:Stop()
            pcall(function()
                local CombatFrameworkLib = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
                local CmrFwLib = CombatFrameworkLib[2]
                local activeController = CmrFwLib.activeController
                
                activeController.timeToNextAttack = 0
                activeController.attacking = false
                activeController.blocking = false
                activeController.timeToNextBlock = 0
                activeController.increment = 0
                activeController.hitboxMagnitude = 100
                activeController.focusStart = 0
                activeController.humanoid.AutoRotate = 0
                activeController.animator.anims.basic[1]:Play(0.01,0.01,0.01)
            end)
        end
    end
end)

--// BRING MOBS
function BringMonster(TargetName, TargetCFrame)
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == TargetName then
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < tonumber(bringfrec) then
                    v.HumanoidRootPart.CFrame = TargetCFrame
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v.HumanoidRootPart.Transparency = 1
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end
    end
end

bringfrec = 250
Main_Setting:addTextbox("Bring Mobs Distance (Default 250)", bringfrec, function(Value)
    bringfrec = Value
end)

local BringMobs = true
Main_Setting:addToggle("Bring Mob", BringMobs, function(Value)
    BringMobs = Value
end)
spawn(function()
    while task.wait() do
        if BringMobs and (LevelFarmQuest or LevelFarmNoQuest) then
            pcall(function()
                BringMonster(Level_Farm_Name, Level_Farm_CFrame)
            end)

        elseif BringMobs and Farm_Bone then
            pcall(function()
                BringMonster(Bone_Farm_Name, Bone_Farm_CFrame)
            end)

        elseif BringMobs and Farm_Ectoplasm then
            pcall(function()
                BringMonster(Ecto_Farm_Name, Ecto_Farm_CFrame)
            end)

        elseif BringMobs and Nearest_Farm then
            pcall(function()
                BringMonster(Nearest_Farm_Name, Nearest_Farm_CFrame)
            end)

        elseif BringMobs and (SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm) then
            pcall(function()
                BringMonster(SelectMonster_Farm_Name, SelectMonster_Farm_CFrame)
            end)

        elseif BringMobs and Auto_Farm_Material then
            pcall(function()
                BringMonster(Material_Farm_Name, Material_Farm_CFrame)
            end)

        elseif BringMobs and (GunMastery_Farm or DevilMastery_Farm) then
            pcall(function()
                BringMonster(Mastery_Farm_Name, Mastery_Farm_CFrame)
            end)

        elseif BringMobs and AutoRengoku then
            pcall(function()
                BringMonster(Rengoku_Farm_Name, Rengoku_Farm_CFrame)
            end)

        elseif BringMobs and AutoCakePrince then
            pcall(function()
                BringMonster(CakePrince_Farm_Name, CakePrince_Farm_CFrame)
            end)

        elseif BringMobs and _G.AutoDoughKing then
            pcall(function()
                BringMonster(DoughKing_Farm_Name, DoughKing_Farm_CFrame)
            end)

        elseif BringMobs and AutoCitizen then
            pcall(function()
                BringMonster(Citizen_Farm_Name, Citizen_Farm_CFrame)
            end)

        elseif BringMobs and AutoEvoRace then
            pcall(function()
                BringMonster(EvoV2_Farm_Name, EvoV2_Farm_CFrame)
            end)

        elseif BringMobs and AutoBartilo then
            pcall(function()
                BringMonster(Bartilo_Farm_Name, Bartilo_Farm_CFrame)
            end)

        elseif BringMobs and AutoSoulGuitar then
            pcall(function()
                BringMonster(SoulGuitar_Farm_Name, SoulGuitar_Farm_CFrame)
            end)

        elseif BringMobs and AutoMusketeer then
            pcall(function()
                BringMonster(Musketere_Farm_Name, Musketere_Farm_CFrame)
            end)
            
        elseif BringMobs and AutoTrain then
            pcall(function()
                BringMonster(Ancient_Farm_Name, Ancient_Farm_CFrame)
            end)

        elseif BringMobs and AutoPirateCastle then
            pcall(function()
                BringMonster(PirateCastle_Name, PirateCastle_CFrame)
            end)
        end
    end
end)

local ByPassTP = true
Main_Setting:addToggle("Bypass Teleport", ByPassTP, function(Value)
    ByPassTP = Value
end)

local AutoSetSpawn = true
Main_Setting:addToggle('Set Spawn Point', AutoSetSpawn, function(Value)
    AutoSetSpawn = Value
end)
spawn(function()
    while wait() do
        if AutoSetSpawn then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end)


Main_Setting:addButton('Reset Character', function()
    local playerc = game.Players.LocalPlayer.Character
    for i,v in pairs(playerc:GetDescendants()) do
        if v:IsA('BasePart') then
            v:Destroy()
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// SETTING RIGHT
local Setting_Right = Tab.Tab_Setting:addSection()

local Skill_Setting = Setting_Right:addMenu('#Skill Mastery')

Skill_Setting:addToggle('Use Skill Z', _G.SkillZ, function(Value)
    _G.SkillZ = Value
end)

Skill_Setting:addToggle('Use Skill X', _G.SkillX, function(Value)
    _G.SkillX = Value
end)

Skill_Setting:addToggle('Use Skill C', _G.SkillC, function(Value)
    _G.SkillC = Value
end)

Skill_Setting:addToggle('Use Skill V', _G.SkillV, function(Value)
    _G.SkillV = Value
end)

Skill_Setting:addToggle('Use Skill F', _G.SkillF, function(Value)
    _G.SkillF = Value
end)

----------------------------------------------------//----------------------------------------------------

local Ability_Settings = Setting_Right:addMenu('#Ability Settings')

local BusoHaki = true
Ability_Settings:addToggle("Buso Haki", BusoHaki, function(Value)
    BusoHaki = Value
end)
spawn(function()
    while wait() do
        if BusoHaki then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

Ability_Settings:addToggle("Ken Haki", KenHaki, function(Value)
    KenHaki = Value
end)
spawn(function()
    while wait() do
        if KenHaki then
            if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
                game:service('VirtualInputManager'):SendKeyEvent(true, "K", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "K", false, game)
            end
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Misc Setting
local Misc_Settings = Setting_Right:addMenu('#Misc Setting')
Misc_Settings:addToggle("Disable Audio Effect", DeleteAudioEffect, function(Value)
    DeleteAudioEffect = Value
end)
spawn(function()
    while wait() do
        if DeleteAudioEffect then
            for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                if v.Name == "Sounds" then
                    for i2,v2 in pairs(v:GetChildren()) do
                        if v2:IsA("Part") then
                            v2:Destroy()
                        end
                    end
                end
                if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") then
                    v:Destroy()
                end
            end
        end
    end
end)

Misc_Settings:addToggle('Hide Notification', HideNotification, function(Value)
    HideNotification = Value
end)
spawn(function()
    while task.wait() do
        if HideNotification then
            for _,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                v:Destroy()
            end
        end
    end
end)

Misc_Settings:addButton("Destroy Effect Animation", function()
    game:GetService("ReplicatedStorage").Assets.Models:Destroy()
    game:GetService("ReplicatedStorage").Assets.GUI:Destroy()
    game:GetService("ReplicatedStorage").Assets.SlashHit:Destroy()
    for i,v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Death:GetChildren()) do
        v:Destroy()
    end
    for i,v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Respawn:GetChildren()) do
        v:Destroy()
    end
end)

----------------------------------------------------//----------------------------------------------------

----------------------------------------------------//----------------------------------------------------
--// Tab Sea
local Sea_Left = Tab.Tab_Sea:addSection()
--// SEA FARM
local Sea_Farm = Sea_Left:addMenu('#Sea Event')

--// TWEEN BOATS
function TPB(BoatsPos)
    local Distance = (BoatsPos.Position - game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.Position).Magnitude
    if Distance > 1 then
        Speed = SpeedBoatTween
    end
    game:GetService("TweenService"):Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = BoatsPos}):Play()
    if _G.StopTween then
        game:GetService("TweenService"):Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = BoatsPos}):Cancel()
    end
end

--// CANCEL TWEEN BOATS
function StopBoats(target)
    if not target then
        _G.StopTween = true
        wait(.1)
        TPB(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame)
        wait(.1)
        _G.StopTween = false
    end
end

--// Boat Tween Anchor
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if AutoSail then
                for _,v in pairs(game:GetService("Workspace").Boats.PirateBrigade:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

--// Boats Body Velocity
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoSail then
                game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.BodyVelocity.MaxForce = Vector3.new(100000,100000,100000)
                game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.BodyVelocity.Velocity = Vector3.new(0,0,0)
            else
                game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.BodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
                game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.BodyVelocity.Velocity = Vector3.new(0,0,0)
            end
        end)
    end
end)

Sea_Farm:addToggle('Auto Rough Sea', AutoSail, function(Value)
    AutoSail = Value
    StopBoats(AutoSail)
    CancelTween(AutoSail)
end)
spawn(function()
    while task.wait() do
        if AutoSail then
            local TikiPost = CFrame.new(-16206.459, 9.05658627, 474.140656, 0.0237221234, 9.85685844e-08, -0.999718606, 4.68728203e-08, 1, 9.9708565e-08, 0.999718606, -4.92249299e-08, 0.0237221234)
            local RoughSeaPos = CFrame.new(-47041.6641, 10.8365746, -6858.74072, 0.703071356, -0.0286799595, 0.710540712, 0.0407584943, 0.999169052, -2.41380471e-09, -0.709950268, 0.0289605707, 0.703656077)
            pcall(function()
                if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                    if ByPassTP then
                        BTP(TikiPost)
                    elseif not ByPassTP then
                        Tween(TikiPost)
                    end
                    if (TikiPost.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                        local args = {
                            [1] = "BuyBoat",
                            [2] = "PirateBrigade"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))

                    elseif game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        if game.Workspace.Enemies:FindFirstChild("Terrorshark") or game.Workspace.Enemies:FindFirstChild("Shark") or game.Workspace.Enemies:FindFirstChild("Piranha") or game.Workspace.Enemies:FindFirstChild("Fish Crew Member") or game.Workspace.Enemies:FindFirstChild('PirateGrandBrigade') or game.Workspace.Enemies:FindFirstChild('PirateBrigade') or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                            --game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                            --StopBoats(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame)
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Terrorshark" or v.Name == "Shark" or v.Name == "Piranha" or v.Name == "Fish Crew Member" then
                                    repeat game:GetService("RunService").Heartbeat:wait() 
                                        TPB(v.HumanoidRootPart.CFrame * CFrame.new(50, 5, 0))
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                    until not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade" then
                                    repeat game:GetService("RunService").Heartbeat:wait() 
                                        TPB(v.VehicleSeat.CFrame * CFrame.new(50, 5, 0))
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                    until not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                            for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
                                if v.Name == "SeaBeast1" then
                                    repeat game:GetService("RunService").Heartbeat:wait() 
                                        TPB(v.RootPart.CFrame * CFrame.new(50, 5, 0))
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                    until not game:GetService("Workspace").SeaBeast:FindFirstChild(v.Name)
                                end
                            end
                        else
                            TPB(RoughSeaPos)
                            local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
                            CameraShakerR:Stop()
                            if (RoughSeaPos.Position - game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.Position).magnitude <= 10 then
                                StopBoats(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame)
                            end
                        end
                    end
                end
                if game.Players.LocalPlayer.Character.Humanoid.Health < 0 then
                    game.Workspace.Boats.PirateBrigade:Destroy()
                end
            end)
        end
    end
end)

Sea_Farm:addToggle('Auto W', AutoTouchW, function(Value)
    AutoTouchW = Value
end)
spawn(function()
    while task.wait() do
        if AutoTouchW then
            game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
            wait(.1)
            game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
        end
    end
end)

Sea_Farm:addToggle('Attack TerrorShark [Boss]', AutoFarmTerrorShark, function(Value)
    AutoFarmTerrorShark = Value
    CancelTween(AutoFarmTerrorShark)
end)
spawn(function()
    while task.wait() do
        if AutoFarmTerrorShark then
            pcall(function()
                if game.Workspace.Enemies:FindFirstChild("Terrorshark") then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    SeaUseSkill = true
                                    EquipTool(SelectWeaponSeaFarm)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    SeaMonName = v.Name
                                    SeaMonCFrame = v.HumanoidRootPart.CFrame
                                    SeaMonPosition = v.HumanoidRootPart.Position
                                    AutoClick()
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not AutoFarmTerrorShark or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                SeaUseSkill = false
                            end
                        end
                    end
                else
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                    end
                end
            end)
        end
    end
end)

Sea_Farm:addToggle('Attack Fish(Crew/Shark/Piranha)', AutoFarmFish, function(Value)
    AutoFarmFish = Value
    CancelTween(AutoFarmFish)
end)
spawn(function()
    while task.wait() do
        if AutoFarmFish then
            pcall(function()
                if game.Workspace.Enemies:FindFirstChild("Shark") or game.Workspace.Enemies:FindFirstChild("Piranha") or game.Workspace.Enemies:FindFirstChild("Fish Crew Member") then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Shark" or v.Name == "Piranha" or v.Name == "Fish Crew Member" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeaponSeaFarm)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,DisSeaFarm,0))
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not AutoFarmFish or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                    end
                end
            end)
        end
    end
end)

Sea_Farm:addToggle('Attack Sea Beast)', AutoFarmSeaBeast, function(Value)
    AutoFarmSeaBeast = Value
    CancelTween(AutoFarmSeaBeast)
end)
spawn(function()
    while task.wait() do
        if AutoFarmSeaBeast then
            pcall(function()
                if game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                    for i,v in pairs (game.Workspace.SeaBeasts:GetChildren()) do
                        if v.Name == "SeaBeast1" then
                            if v:FindFirstChild("RootPart") and v.Health.Value > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    SeaUseSkill = true
                                    EquipTool(SelectWeaponSeaFarm)
                                    Tween(v.RootPart.CFrame * CFrame.new(0,300,0))
                                    v.RootPart.CanCollide = false
                                    v.RootPart.Size = Vector3.new(60,60,60)
                                    v.RootPart.Transparency = 1
                                    SeaMonName = v.Name
                                    SeaMonCFrame = v.RootPart.CFrame
                                    SeaMonPosition = v.RootPart.Position
                                    AutoClick()
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not AutoFarmSeaBeast or not v.Parent or v.Health.Value <= 0 or not game:GetService("Workspace").SeaBeasts:FindFirstChild(v.Name)
                                SeaUseSkill = false
                            end
                        end
                    end
                else
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                    end
                end
            end)
        end
    end
end)

Sea_Farm:addToggle('Attack Ghost Boats)', AutoFarmGhostBoats, function(Value)
    AutoFarmGhostBoats = Value
    CancelTween(AutoFarmGhostBoats)
end)
spawn(function()
    while task.wait() do
        if AutoFarmGhostBoats then
            pcall(function()
                if game.Workspace.Enemies:FindFirstChild("PirateBrigade") or game.Workspace.Enemies:FindFirstChild("PirateGrandBrigade") then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "PirateBrigade" or v.Name == "PirateGrandBrigade" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("VehicleSeat") and v.Humanoid.Value > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    SeaUseSkill = true
                                    EquipTool(SelectWeaponSeaFarm)
                                    Tween(v.VehicleSeat.CFrame * CFrame.new(0,70,0))
                                    v.VehicleSeat.CanCollide = false
                                    v.VehicleSeat.Size = Vector3.new(60,60,60)
                                    v.VehicleSeat.Transparency = 1
                                    SeaMonName = v.Name
                                    SeaMonCFrame = v.VehicleSeat.CFrame
                                    SeaMonPosition = v.VehicleSeat.Position
                                    AutoClick()
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not AutoFarmGhostBoats or not v.Parent or v.Humanoid.Value <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                SeaUseSkill = false
                            end
                        end
                    end
                else
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Tab Sea
local Sea_Right = Tab.Tab_Sea:addSection()

local Config_Sea = Sea_Right:addMenu('#Config')

local WeaponList = {"Melee","Blox Fruit","Sword","Gun"}
Config_Sea:addDropdown("Select Weapon", SelectWeaponSeaFarm, WeaponList,function(weaponfunc)
    SelectWeaponSeaFarm = weaponfunc
end)
spawn(function()
    while wait() do
        for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ToolTip == SelectWeaponSeaFarm then
                SelectWeaponSeaFarm = v.Name
            end
        end
    end
end)

DisSeaFarm = 30
Config_Sea:addTextbox("Distance Sea Farm", DisSeaFarm, function(Value)
    DisSeaFarm = Value
end)

SpeedBoatTween = 200
Config_Sea:addTextbox("Tween Boat Speed", SpeedBoatTween, function(Value)
    SpeedBoatTween = Value
end)

SpeedAllBoat = 100
Config_Sea:addTextbox("Speed Boat Hack", SpeedAllBoat, function(Value)
    SpeedAllBoat = Value
    if SpeedAllBoat then
        game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.MaxSpeed = SpeedAllBoat
    end
end)

Config_Sea:addToggle('Skill Z', _G.SeaSkillZ, function(Value)
    _G.SeaSkillZ = Value
end)

Config_Sea:addToggle('Skill X', _G.SeaSkillX, function(Value)
    _G.SeaSkillX = Value
end)

Config_Sea:addToggle('Skill C', _G.SeaSkillC, function(Value)
    _G.SeaSkillC = Value
end)

Config_Sea:addToggle('Skill V', _G.SeaSkillV, function(Value)
    _G.SeaSkillV = Value
end)

Config_Sea:addToggle('Skill F', _G.SeaSkillF, function(Value)
    _G.SeaSkillF = Value
end)

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if SeaUseSkill then
                        if type(args[2]) == "vector" then
                            args[2] = SeaMonPosition
                        else
                            args[2] = CFrame.new(SeaMonPosition)
                        end
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
spawn(function()
    while task.wait() do
        if SeaUseSkill then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == SeaMonName then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            SeaMonPosition = v.HumanoidRootPart.Position or v.VehicleSeat.Position or v.RootPart.CFrame
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponSeaFarm) then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponSeaFarm).MousePos.Value = SeaMonPosition
                                if _G.SeaSkillZ then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                                if _G.SeaSkillX then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                if _G.SeaSkillC then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                                if _G.SeaSkillV then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end
                                if _G.SeaSkillF then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                                    wait(.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                                end
                            end
                        until not AutoFarmGhostBoats or not AutoFarmSeaBeast or not AutoFarmTerrorShark or not SeaUseSkill or v.Humanoid.Health == 0 or v.Humanoid.Value or v.Health.Value
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Racev4 Left
local Race_V4_Left = Tab.Tab_RaceV4:addSection()

local IslandInfo = Race_V4_Left:addMenu("#Island Status")

local MirageCheck = IslandInfo:addLabel("")
spawn(function()
	while task.wait() do
		if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            MirageCheck:Refresh("Mirage Island : Spawn âœ…")
        else
            MirageCheck:Refresh("Mirage Island : Not Spawn âŒ")
        end
	end
end)

local KitsuneCheck = IslandInfo:addLabel("")
spawn(function()
	while task.wait() do
		if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            KitsuneCheck:Refresh("Kitsune Island : Spawn âœ…")
        else
            KitsuneCheck:Refresh("Kitsune Island : Not Spawn âŒ")
        end
	end
end)

local MoonCheck = IslandInfo:addLabel("")
spawn(function()
    while wait() do
        if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
            MoonCheck:Refresh("Moon Status : ðŸŒ‘ 100%")
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
            MoonCheck:Refresh("Moon Status : ðŸŒ’ 75%")
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
            MoonCheck:Refresh("Moon Status : ðŸŒ“ 50%")
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
            MoonCheck:Refresh("Moon Status : ðŸŒ— 25%")
        elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
            MoonCheck:Refresh("Moon Status : ðŸŒ– 15%")
        else
            MoonCheck:Refresh("Moon Status : ðŸŒš 0%")
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Mirage Island
local Mirage_Island = Race_V4_Left:addMenu('#Mirage Island')

Mirage_Island:addToggle("Mirage ESP", MirageIslandEsp, function(Value)
    MirageIslandEsp = Value
end)
spawn(function()
    while wait() do
        if MirageIslandEsp then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if v.Name == "Mirage Island" then
                        if not v:FindFirstChild("MirageESPIsland") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")
    
                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "MirageESPIsland"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    
                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10)
                        v.MirageESPIsland.TextLabel.Text = v.Name.."\n".."["..Dis.."]"
                    end
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                if v.Name == "Mirage Island" then
                    if v:FindFirstChild("MirageESPIsland") then
                        v.MirageESPIsland:Destroy()
                    end
                end
            end
        end
    end
end)

Mirage_Island:addToggle("Gear ESP", GearESP, function(Value)
    GearESP = Value
end)
spawn(function()
    while wait() do
        if GearESP then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                    if v:IsA("MeshPart")then 
                        if v.Material ==  Enum.Material.Neon then  
                            if not v:FindFirstChild("GearESPMirage") then
                                local BillboardGui = Instance.new("BillboardGui")
                                local TextLabel = Instance.new("TextLabel")

                                BillboardGui.Parent = v
                                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                BillboardGui.Active = true
                                BillboardGui.Name = "GearESPMirage"
                                BillboardGui.AlwaysOnTop = true
                                BillboardGui.LightInfluence = 1.000
                                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                TextLabel.Parent = BillboardGui
                                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.BackgroundTransparency = 1.000
                                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                TextLabel.Font = Enum.Font.GothamBold
                                TextLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                                TextLabel.FontSize = "Size14"
                                TextLabel.TextStrokeTransparency = 0.5
                            end
                            local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude)
                            v.GearESPMirage.TextLabel.Text = v.Name.." - ["..Dis.." M]"
                        end
                    end
                end
            end)
        else
            for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                if v:IsA("MeshPart")then 
                    if v.Material ==  Enum.Material.Neon then  
                        if v:FindFirstChild("GearESPMirage") then
                            v:FindFirstChild("GearESPMirage"):Destroy()
                        end
                    end
                end
            end
        end
    end
end)

Mirage_Island:addToggle("Fruit Dealer ESP", AfdESP, function(Value)
    AfdESP = Value
end)
spawn(function()
    while wait() do
        if AfdESP then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v.Name == "Advanced Fruit Dealer" then
                        if not v:FindFirstChild("FruitDealerESP") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "FruitDealerESP"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.FruitDealerESP.TextLabel.Text = v.Name.." - ["..Dis.." M]"
                    end
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                if v.Name == "Advanced Fruit Dealer" then
                    if v:FindFirstChild("FruitDealerESP") then
                        v.FruitDealerESP:Destroy()
                    end
                end
            end
        end
    end
end)

Mirage_Island:addToggle("Teleport to Mirage", TeleporttoMirage, function(Value)
    TeleporttoMirage = Value
    CancelTween(TeleporttoMirage)
end)
spawn(function()
    while task.wait() do
        if TeleporttoMirage then
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                _G.CenterMI = game:GetService("Workspace").Map.MysticIsland.Center.Position
                Tween(CFrame.new(_G.CenterMI))
            end
        end
    end
end)

Mirage_Island:addToggle("Teleport to Gear", TeleporttoGear, function(Value)
    TeleporttoGear = Value
    CancelTween(TeleporttoGear)
end)
spawn(function()
    while task.wait() do
        if TeleporttoGear then
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                    if v:IsA("MeshPart")then 
                        if v.Material ==  Enum.Material.Neon then  
                            Tween(v.CFrame)
                        end
                    end
                end
            end
        end
    end
end)

Mirage_Island:addToggle("Teleport to Advance Fruit Dealer", TeleporttoFruitDealer, function(Value)
    TeleporttoFruitDealer = Value
    CancelTween(TeleporttoFruitDealer)
end)
spawn(function()
    while wait() do
        if TeleporttoFruitDealer then
            if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                Tween(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
            end
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Kitsune Island
local Kitsune_Island = Race_V4_Left:addMenu('#Kitsune Island')

Kitsune_Island:addToggle("Kitsune ESP", KitsuneIslandEsp, function(Value)
    KitsuneIslandEsp = Value
end)
spawn(function()
    while wait() do
        if KitsuneIslandEsp then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if v.Name == "Kitsune Island" then
                        if not v:FindFirstChild("KitsuneESPIsland") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")
    
                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "KitsuneESPIsland"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    
                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10)
                        v.KitsuneESPIsland.TextLabel.Text = v.Name.."\n".."["..Dis.."]"
                    end
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                if v.Name == "Kitsune Island" then
                    if v:FindFirstChild("KitsuneESPIsland") then
                        v.KitsuneESPIsland:Destroy()
                    end
                end
            end
        end
    end
end)

Kitsune_Island:addToggle("Teleport to Kitsune", TeleporttoKitsune, function(Value)
    TeleporttoKitsune = Value
    CancelTween(TeleporttoKitsune)
end)
spawn(function()
    while task.wait() do
        if TeleporttoKitsune then
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                local kitsuneislands = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                if kitsuneislands:FindFirstChild("ShrineActive") then
                    for _, v in pairs(kitsuneislands:FindFirstChild("ShrineActive"):GetDescendants()) do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            Tween(v.CFrame)
                        end
                    end
                end
            end
        end
    end
end)

Kitsune_Island:addToggle("Collect Azure", CollectAzureAmber, function(Value)
    CollectAzureAmber = Value
    CancelTween(CollectAzureAmber)
end)
spawn(function()
    while wait() do
        if CollectAzureAmber then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                    Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Racev4 Right
local Race_V4_Right = Tab.Tab_RaceV4:addSection()

local RaceV4 = Race_V4_Right:addMenu('#Upgrade Race')

RaceV4:addToggle("Race Door", RaceDoors, function(Value)
    RaceDoors = Value
    CancelTween(RaceDoors)
end)
spawn(function()
    while task.wait(.1) do
        if RaceDoors then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
            wait(.5)
            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                TP2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                TP2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                TP2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                TP2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                TP2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                TP2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
            end
        end
    end
end)

RaceV4:addToggle("Auto Trial", AutoCompleteRace, function(Value)
    AutoCompleteRace = Value
end)
spawn(function()
    while task.wait() do
        if AutoCompleteRace then
            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                pcall(function()
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                                until not AutoCompleteRace or not v.Parent or not game.Workspace.Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end)
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                    if v.Name ==  "snowisland_Cylinder.081" then
                        TP2(v.CFrame * CFrame.new(0,0,0))
                    end
                end
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                    if v.Name ==  "HumanoidRootPart" then
                        TP2(v.CFrame * CFrame.new(20,450,0))
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                
                        wait(0.5)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                TP2(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                pcall(function()
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                                until not AutoCompleteRace or not v.Parent or not game.Workspace.Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end)
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == "StartPoint" then
                        TP2(v.CFrame* CFrame.new(0,10,0))
                    end
                end
            end
        end
    end
end)

RaceV4:addToggle("Auto Train", AutoTrain, function(Value)
    AutoTrain = Value
end)
spawn(function()
    while task.wait() do
        if AutoTrain then
            local AncientCFrame = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Ancient_Farm_Name = v.Name
                                    Ancient_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until not AutoTrain or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Tween(AncientCFrame)
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--//Area
local RaceV4_Area = Race_V4_Right:addMenu('#Area')

RaceV4_Area:addButton("Timple of Time", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    wait(1)
    TP2(CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875))
end)

RaceV4_Area:addButton("Lever Pull", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    wait(1)
    TP2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
end)

RaceV4_Area:addButton("Ancient One", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28981.552734375, 14888.4267578125, -120.245849609375))
    wait(1)
    TP2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
end)

RaceV4_Area:addButton("Safe Zone", function()
    TP2(CFrame.new(28273.0859375, 14896.5078125, 157.42063903808594))
end)

RaceV4_Area:addButton("PVP Zone", function()
    TP2(CFrame.new(28766.681640625, 14967.1455078125, -164.13290405273438))
end)

----------------------------------------------------//----------------------------------------------------
--// FARM LEFT
local Farm_Left = Tab.Tab_2:addSection()

--// LEVEL FARM
local Level_Farm = Farm_Left:addMenu('#Level Farm')

Level_Farm:addToggle('Level Farm Quest', LevelFarmQuest, function(Value)
    LevelFarmQuest = Value
    _G.SelectMonster  = nil
    CancelTween(LevelFarmQuest)
end)

Level_Farm:addToggle('Level Farm No Quest', LevelFarmNoQuest, function(Value)
    LevelFarmNoQuest = Value
    _G.SelectMonster  = nil
    CancelTween(LevelFarmNoQuest)
end)

spawn(function()
    while task.wait() do
        if LevelFarmQuest then
            pcall(function()
                CheckLevel()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if ByPassTP then
                        BTP(CFrameQ)
                    elseif not ByPassTP then
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end

                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == Ms then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Level_Farm_Name = v.Name
                                        Level_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not LevelFarmQuest or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        Tween(CFrameMon)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if LevelFarmNoQuest then
            pcall(function()
                CheckLevel()
                if game.Workspace.Enemies:FindFirstChild(Ms) then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v.Name == Ms then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Level_Farm_Name = v.Name
                                    Level_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until not LevelFarmNoQuest or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    if ByPassTP then
                        BTP(CFrameMon)
                    elseif not ByPassTP then
                        Tween(CFrameMon)
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// OTHER FARM
local Other_Farm = Farm_Left:addMenu('#Other Farm')
Other_Farm:addToggle("Buy Random Bone", Auto_Trade_Bone, function(Value)
    Auto_Trade_Bone = Value

    while Auto_Trade_Bone do wait()
        local args = {   
            [1] = "Bones",   
            [2] = "Buy",
            [3] = 1,
            [4] = 1
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)

Other_Farm:addToggle('Bones Farm (Third Sea)', Farm_Bone, function(Value)
    Farm_Bone = Value
    CancelTween(Farm_Bone)
end)
spawn(function()
    while task.wait() do
        if Farm_Bone then
            pcall(function()
                local boneframe = CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625)
                if ByPassTP then
                    BTP(boneframe)
                elseif not ByPassTP then
                    Tween(boneframe)
                end
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name =="Demonic Soul" or v.Name == "Posessed Mummy" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                Bone_Farm_Name = v.Name
                                Bone_Farm_CFrame = v.HumanoidRootPart.CFrame
                                AutoClick()
                            until not Farm_Bone or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Reborn Skeleton" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Living Zombie" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Demonic Soul" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Posessed Mummy" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)
        end
    end
end)

Other_Farm:addToggle('Ectoplasm Farm (Second Sea)', Farm_Ectoplasm, function(Value)
    Farm_Ectoplasm = Value
    CancelTween(Farm_Ectoplasm)
end)
spawn(function()
    while task.wait() do
        if Farm_Ectoplasm then
            pcall(function()
                local EctoMob = CFrame.new(904.4072265625, 181.05767822266, 33341.38671875)
                if ByPassTP then
                    BTP(EctoMob)
                elseif not ByPassTP then
                    Tween(EctoMob)
                end
                local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if Distance > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name == "Ship Steward" or v.Name == "Ship Engineer" or v.Name == "Ship Deckhand" or v.Name == "Ship Officer" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                Ecto_Farm_Name = v.Name
                                Ecto_Farm_CFrame = v.HumanoidRootPart.CFrame
                                AutoClick()
                            until not Farm_Ectoplasm or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Ship Steward" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Engineer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Deckhand" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Officer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)
        end
    end
end)

Other_Farm:addToggle('Nearest Farm', Nearest_Farm, function(Value)
    Nearest_Farm = Value
    CancelTween(Nearest_Farm)
end)
spawn(function()
    while task.wait() do
        if Nearest_Farm then
            pcall(function()
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 1000 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Nearest_Farm_Name = v.Name
                                    Nearest_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until not Nearest_Farm or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// SELECT MONSTER
local SelectMonster_Farm = Farm_Left:addMenu('#Select Monster Farm')

SelectMonster_Farm:addDropdown("Select Monster", _G.SelectMonster, tableMon, function(Value)
    _G.SelectMonster = Value
end)

SelectMonster_Farm:addToggle('Auto Farm Select Monster (Quest)', SelectMonster_Quest_Farm, function(Value)
    SelectMonster_Quest_Farm = Value
    CancelTween(SelectMonster_Quest_Farm)
end)

spawn(function()
    while task.wait() do
        if SelectMonster_Quest_Farm then
            pcall(function()
                CheckLevel(_G.SelectMonster)
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if ByPassTP then
                        BTP(CFrameQ)
                    elseif not ByPassTP then
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == Ms then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        SelectMonster_Farm_Name = v.Name
                                        SelectMonster_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not SelectMonster_Quest_Farm or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        Tween(CFrameMon)
                    end
                end
            end)
        end
    end
end)

SelectMonster_Farm:addToggle('Auto Farm Select Monster (No Quest)', SelectMonster_NoQuest_Farm, function(Value)
    SelectMonster_NoQuest_Farm = Value
    CancelTween(SelectMonster_NoQuest_Farm)
end)
spawn(function()
    while task.wait() do
        if SelectMonster_NoQuest_Farm then
            pcall(function()
                CheckLevel(_G.SelectMonster)
                if ByPassTP then
                    BTP(CFrameQ)
                elseif not ByPassTP then
                    Tween(CFrameQ)
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == Ms then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    SelectMonster_Farm_Name = v.Name
                                    SelectMonster_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until not SelectMonster_NoQuest_Farm or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Tween(CFrameMon)
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// FARM RIGHT
local Farm_Right = Tab.Tab_2:addSection()

local Mastery_Farm = Farm_Right:addMenu('#Mastery Farm')
KillPercent = 25
Mastery_Farm:addTextbox('Skill Percentace %', KillPercent, function(Value)
    KillPercent = Value
end)

local MasteryType = {'Quest', 'No Quest', 'Nearest', 'Bone', 'Ecto', 'Cake Prince'}
SelectedMethodMastery = "Quest"
Mastery_Farm:addDropdown('Select Method', SelectedMethodMastery, MasteryType, function(Value)
    SelectedMethodMastery = Value
end)

Mastery_Farm:addToggle('Auto Farm Devil Mastery', DevilMastery_Farm, function(Value)
    DevilMastery_Farm = Value
    CancelTween(DevilMastery_Farm)
end)

spawn(function()
    pcall(function()
        while task.wait() do
            for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == "Blox Fruit" then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        CurrentEquipDevilFruit = v.Name
                    end
                end
            end
        end
    end)
end)
--// Use Devil Mastery
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if UseSkill then
                        if type(args[2]) == "vector" then
                            args[2] = PositionSkillMasteryDevilFruit
                        else
                            args[2] = CFrame.new(PositionSkillMasteryDevilFruit)
                        end
                        return old(unpack(args))
                    end
                    if UseGunMastery then
                        if type(args[2]) == "vector" then
                            args[2] = PositionSkillMasteryGun
                        else
                            args[2] = CFrame.new(PositionSkillMasteryGun)
                        end
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
spawn(function()
    while task.wait() do
        if UseSkill then 
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Mastery_Farm_Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            EquipTool(CurrentEquipDevilFruit)
                            PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipDevilFruit) then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipDevilFruit).MousePos.Value = PositionSkillMasteryDevilFruit
                                local DevilFruitMastery = game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipDevilFruit).Level.Value
                                if _G.SkillZ and DevilFruitMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                                if _G.SkillX and DevilFruitMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                if _G.SkillC and DevilFruitMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                                if _G.SkillV and DevilFruitMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end
                                if _G.SkillF and DevilFruitMastery >= 1 then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                                    wait(.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                                end
                            end
                        until not UseSkill or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if DevilMastery_Farm and SelectedMethodMastery == "Quest" then
            pcall(function()
                CheckLevel()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if ByPassTP then
                        BTP(CFrameQ)
                    elseif not ByPassTP then
                        Tween(CFrameQ)
                    end

                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if v.Name == Ms then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                            UseSkill = true
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        else
                                            UseSkill = false
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Mastery_Farm_Name = v.Name
                                            Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                        end
                                    until not DevilMastery_Farm or not SelectedMethodMastery == "Quest" or not v.Parent or v.Humanoid.Health == 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    else
                        Tween(CFrameMon)
                    end
                end
            end)

        elseif DevilMastery_Farm and SelectedMethodMastery == "No Quest" then
            pcall(function()
                CheckLevel()
                if ByPassTP then
                    BTP(CFrameQ)
                elseif not ByPassTP then
                    Tween(CFrameQ)
                end
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == Ms then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseSkill = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                else
                                    UseSkill = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                                
                            until not DevilMastery_Farm or not SelectedMethodMastery == "Quest" or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        elseif DevilMastery_Farm and SelectedMethodMastery == "Nearest" then
            pcall(function()
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 2000 then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseSkill = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                else
                                    UseSkill = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not DevilMastery_Farm or not SelectedMethodMastery == 'Nearest' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        elseif DevilMastery_Farm and SelectedMethodMastery == "Bone" then
            pcall(function()
                local boneframe = CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625)
                if ByPassTP then
                    BTP(boneframe)
                elseif not ByPassTP then
                    Tween(boneframe)
                end
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name =="Demonic Soul" or v.Name == "Posessed Mummy" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseSkill = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                else
                                    UseSkill = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not DevilMastery_Farm or not SelectedMethodMastery == 'Bone' or not v.Parent or v.Humanoid.Health == 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Reborn Skeleton" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Living Zombie" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Demonic Soul" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Posessed Mummy" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)

        elseif DevilMastery_Farm and SelectedMethodMastery == "Ecto" then
            pcall(function()
                local EctoMob = CFrame.new(904.4072265625, 181.05767822266, 33341.38671875)
                if ByPassTP then
                    BTP(EctoMob)
                elseif not ByPassTP then
                    Tween(EctoMob)
                end
                local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if Distance > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == "Ship Steward" or v.Name == "Ship Engineer" or v.Name == "Ship Deckhand" or v.Name == "Ship Officer" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseSkill = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                else
                                    UseSkill = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not DevilMastery_Farm or not SelectedMethodMastery == 'Ecto' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Ship Steward" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Engineer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Deckhand" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Officer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)

        elseif DevilMastery_Farm and SelectedMethodMastery == "Cake Prince" then
            pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                        UseSkill = true
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    else
                                        UseSkill = false
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Mastery_Farm_Name = v.Name
                                        Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    end
                                until not DevilMastery_Farm or not SelectedMethodMastery == 'Cake Prince' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                            Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                            UseSkill = true
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        else
                                            UseSkill = false
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Mastery_Farm_Name = v.Name
                                            Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                        end
                                    until not DevilMastery_Farm or not SelectedMethodMastery == 'Cake Prince' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    else
                        local cakepos = CFrame.new(-2077, 252, -12373)
                        if ByPassTP then
                            BTP(cakepos)
                        else
                            Tween(cakepos)
                        end
                    end
                end
            end)

        else
            UseSkill = false
        end
    end
end)

Mastery_Farm:addToggle('Auto Farm Gun Mastery', GunMastery_Farm, function(Value)
    GunMastery_Farm = Value
    CancelTween(GunMastery_Farm)
end)
--// Use Gun Mastery
spawn(function()
    pcall(function()
        while task.wait() do
            for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == "Gun" then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        CurrentEquipGun = v.Name
                    end
                end
            end
        end
    end)
end)
spawn(function()
    while task.wait() do
        if UseGunMastery then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Mastery_Farm_Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            EquipTool(CurrentEquipGun)
                            PositionSkillMasteryGun = v.HumanoidRootPart.Position
                            HumanoidRootPartMon = v.HumanoidRootPart
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipGun) then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipGun).MousePos.Value = PositionSkillMasteryGun
                                game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                                game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(PositionSkillMasteryGun,HumanoidRootPartMon)
                                local GunMastery = game:GetService("Players").LocalPlayer.Character:FindFirstChild(CurrentEquipGun).Level.Value
                                if _G.SkillZ and GunMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                                if _G.SkillX and GunMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                if _G.SkillC and GunMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                                if _G.SkillV and GunMastery >= 1 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end
                                if _G.SkillF and GunMastery >= 1 then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                                    wait(.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                                end
                            end
                        until not UseGunMastery or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                    end
                end
            end)
        end
    end
end) 
spawn(function()
    while task.wait() do
        if GunMastery_Farm and SelectedMethodMastery == "Quest" then
            pcall(function()
                CheckLevel()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    UseGunMastery = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if ByPassTP then
                        BTP(CFrameQ)
                    elseif not ByPassTP then
                        Tween(CFrameQ)
                    end

                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if v.Name == Ms then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                            UseGunMastery = true
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            AutoClick()
                                        else
                                            UseGunMastery = false
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Mastery_Farm_Name = v.Name
                                            Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                        end
                                    until not GunMastery_Farm or not SelectedMethodMastery == "Quest" or not v.Parent or v.Humanoid.Health == 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    else
                        Tween(CFrameMon)
                    end
                end
            end)

        elseif GunMastery_Farm and SelectedMethodMastery == "No Quest" then
            UseGunMastery = false
            pcall(function()
                CheckLevel()
                if ByPassTP then
                    BTP(CFrameQ)
                elseif not ByPassTP then
                    Tween(CFrameQ)
                end
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == Ms then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseGunMastery = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    AutoClick()
                                else
                                    UseGunMastery = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not GunMastery_Farm or not SelectedMethodMastery == "Quest" or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)

        elseif GunMastery_Farm and SelectedMethodMastery == "Nearest" then
            UseGunMastery = false
            pcall(function()
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 2000 then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseGunMastery = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    AutoClick()
                                else
                                    UseGunMastery = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not GunMastery_Farm or not SelectedMethodMastery == 'Nearest' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)

        elseif GunMastery_Farm and SelectedMethodMastery == "Bone" then
            pcall(function()
                local boneframe = CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625)
                if ByPassTP then
                    BTP(boneframe)
                elseif not ByPassTP then
                    Tween(boneframe)
                end
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name =="Demonic Soul" or v.Name == "Posessed Mummy" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseGunMastery = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    AutoClick()
                                else
                                    UseGunMastery = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not GunMastery_Farm or not SelectedMethodMastery == 'Bone' or not v.Parent or v.Humanoid.Health == 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Reborn Skeleton" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Living Zombie" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Demonic Soul" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Posessed Mummy" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)
        
        elseif GunMastery_Farm and SelectedMethodMastery == "Ecto" then
            pcall(function()
                local EctoMob = CFrame.new(904.4072265625, 181.05767822266, 33341.38671875)
                if ByPassTP then
                    BTP(EctoMob)
                elseif not ByPassTP then
                    Tween(EctoMob)
                end
                local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if Distance > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Name == "Ship Steward" or v.Name == "Ship Engineer" or v.Name == "Ship Deckhand" or v.Name == "Ship Officer" then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseGunMastery = true
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    AutoClick()
                                else
                                    UseGunMastery = false
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Mastery_Farm_Name = v.Name
                                    Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                end
                            until not GunMastery_Farm or not SelectedMethodMastery == 'Ecto' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v.Name == "Ship Steward" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Engineer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Deckhand" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    elseif v.Name == "Ship Officer" then
                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    end
                end
            end)
        
        elseif GunMastery_Farm and SelectedMethodMastery == "Cake Prince" then
            pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                        UseGunMastery = true
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        AutoClick()
                                    else
                                        UseGunMastery = false
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Mastery_Farm_Name = v.Name
                                        Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    end
                                until not GunMastery_Farm or not SelectedMethodMastery == 'Cake Prince' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                            Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                            UseGunMastery = true
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            AutoClick()
                                        else
                                            UseGunMastery = false
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            Mastery_Farm_Name = v.Name
                                            Mastery_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                        end
                                    until not GunMastery_Farm or not SelectedMethodMastery == 'Cake Prince' or not v.Parent or v.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    else
                        local cakepos = CFrame.new(-2077, 252, -12373)
                        if ByPassTP then
                            BTP(cakepos)
                        else
                            Tween(cakepos)
                        end
                    end
                end
            end)
        else
            UseGunMastery = false
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// BOSS FARM
local Boss_Farm = Farm_Right:addMenu('#Boss Farm')
local BossNameStorage = {
    "The Gorrila King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Ice Admiral", "Greybeard",
    "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order",
    "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper", "rip_indra True Form"
}
local BossList = {}
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
    if table.find(BossNameStorage, v.Name) then
        table.insert(BossList, v.Name)
    end
end

local Refresh_Boss = Boss_Farm:addDropdown('Select Boss', SelectBoss, BossList, function(Value)
    SelectBoss = Value
end)

Boss_Farm:addButton('Refresh Boss', function()
    local NewBossList = {}
    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
        if table.find(BossNameStorage, v.Name) then
            table.insert(NewBossList, v.Name)
        end
    end
    Refresh_Boss:Clear()
    Refresh_Boss:Refresh(NewBossList)
end)

Boss_Farm:addToggle('Auto Farm Boss (Quest)', AutoFarmBossQuest, function(Value)
    AutoFarmBossQuest = Value
    CancelTween(AutoFarmBossQuest)
end)
spawn(function()
    while task.wait() do
        if AutoFarmBossQuest then
            pcall(function()
                CheckBossQuest(SelectBoss)
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if ByPassTP then
                        BTP(CFrameQBoss)
                    elseif not ByPassTP then
                        Tween(CFrameQBoss)
                    end
                    if (CFrameQBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuestBoss,QuestLvBoss)
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == SelectBoss then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until not AutoFarmBossQuest or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        Tween(CFrameBoss)
                    end
                end
            end)
        end
    end
end)

Boss_Farm:addToggle('Auto Farm Boss (No Quest)', AutoFarmBossNoQuest, function(Value)
    AutoFarmBossNoQuest = Value
    CancelTween(AutoFarmBossNoQuest)
end)
spawn(function()
    while task.wait() do
        if AutoFarmBossNoQuest then
            pcall(function()
                CheckBossQuest(SelectBoss)
                if ByPassTP then
                    BTP(CFrameBoss)
                elseif not ByPassTP then
                    Tween(CFrameBoss)
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name == SelectBoss then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                AutoClick()
                            until not AutoFarmBossNoQuest or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// SUBS FARM LEFT
local Subs_Farm_Left = Tab.Tab_SubFarm:addSection()

local Elite_Hunter_Quest = Subs_Farm_Left:addMenu('#Elite Hunter')

local EliteProgress = Elite_Hunter_Quest:addLabel("")
local EliteStatus = Elite_Hunter_Quest:addLabel("")
spawn(function()
    while wait() do
        local progelit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")
        EliteProgress:Refresh("Elite Boss Killed : " .. progelit)
        if game:GetService('ReplicatedStorage'):FindFirstChild('Diablo') or game:GetService('ReplicatedStorage'):FindFirstChild('Deandre') or game:GetService('ReplicatedStorage'):FindFirstChild('Urban') then
            EliteStatus:Refresh("Boss Status : Boss is Spawned.")
        elseif not game:GetService('ReplicatedStorage'):FindFirstChild('Diablo') or not game:GetService('ReplicatedStorage'):FindFirstChild('Deandre') or not game:GetService('ReplicatedStorage'):FindFirstChild('Urban') then
            EliteStatus:Refresh("Boss Status : Boss is not Spawned.")
        end
    end
end)

Elite_Hunter_Quest:addToggle('Auto Elite Hunter', AutoEliteHunter, function(Value)
    AutoEliteHunter = Value
    CancelTween(AutoEliteHunter)
end)
spawn(function()
    while task.wait() do
        if AutoEliteHunter then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            AutoClick()
                                        until AutoEliteHunter == false or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                if ByPassTP then
                                    BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                                else
                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                if ByPassTP then
                                    BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                                else
                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                if ByPassTP then
                                    BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                                else
                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Cake Prince
local Cake_Prince_Quest = Subs_Farm_Left:addMenu('#Cake Prince & Dough King')
local CakePrinceStatus = Cake_Prince_Quest:addLabel("")
spawn(function()
    while wait() do
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
            CakePrinceStatus:Refresh("Killed Left : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)..' / 500')
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
            CakePrinceStatus:Refresh("Killed Left : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40)..' / 500')
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
            CakePrinceStatus:Refresh("Killed Left : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39)..' / 500')
        else
            CakePrinceStatus:Refresh("Cake Prince Spawned...!!!")
        end
    end
end)

Cake_Prince_Quest:addToggle('Auto Cake Prince', AutoCakePrince, function(Value)
    AutoCakePrince = Value
    CancelTween(AutoCakePrince)
end)
spawn(function()
    while task.wait() do
        if AutoCakePrince then
            pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if AutoCakePrince and v.Name == "Cake Prince" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until not AutoCakePrince or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                            Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        CakePrince_Farm_Name = v.Name
                                        CakePrince_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not AutoCakePrince or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        local cakepos = CFrame.new(-2077, 252, -12373)
                        if ByPassTP then
                            BTP(cakepos)
                        else
                            Tween(cakepos)
                        end
                    end
                end
            end)
        end
    end
end)

Cake_Prince_Quest:addToggle('Auto Dough King (Need to Get Sweet Chalice)', _G.AutoDoughKing, function(Value)
    _G.AutoDoughKing = Value
    CancelTween(_G.AutoDoughKing)
end)

spawn(function()
    while task.wait(.1) do
        if _G.AutoDoughKing then
            local Place_1 = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
            pcall(function()
                if game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakeScientist", "Check")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                        Tween(Place_1)
                        if (Place_1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 5 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
                            wait(0.5)
                            EquipTool("Red Key")
                            wait(0.5)
                        end
                    elseif game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Dough King" then
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            AutoClick()
                                        until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end
                        else
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                                local BigMirrorPlace = CFrame.new(-2151.82153, 149.315704, -12404.9053)
                                Tween(BigMirrorPlace)
                                if (BigMirrorPlace.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
                                    wait(1)
                                end
                            end 
                        end
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            DoughKing_Farm_Name = v.Name
                                            DoughKing_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                                        until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end
                        else
                            Tween(CFrame.new(-2077, 252, -12373))
                            if (CFrame.new(-2077, 252, -12373).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2077, 252, -12373)
                            end
                        end

                    elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice")) and GetMaterial("Conjured Cocoa") >= 10 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                        wait(0.2)
                    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") and (game.Workspace.Enemies:FindFirstChild("Deandre") or game.Workspace.Enemies:FindFirstChild("Urban") or game.Workspace.Enemies:FindFirstChild("Diablo") or game.ReplicatedStorage:FindFirstChild("Deandre") or game.ReplicatedStorage:FindFirstChild("Urban") or game.ReplicatedStorage:FindFirstChild("Diablo")) then
                        if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v.Name == "Diablo" or v.Name == "Urban" or v.Name == "Deandre" then
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                repeat game:GetService("RunService").Heartbeat:wait()
                                                    EquipTool(SelectWeapon)
                                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.Humanoid:ChangeState(11)
                                                    v.Humanoid:ChangeState(14)
                                                    AutoClick()
                                                until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                            end
                                        end
                                    end
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                        if ByPassTP then
                                            BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                                        else
                                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                                        end
                                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                        if ByPassTP then
                                            BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                                        else
                                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                                        end
                                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                        if ByPassTP then
                                            BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                                        else
                                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                                        end
                                    end
                                end
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if (v.Name == "Candy Rebel" or v.Name == "Sweet Thief" or v.Name == "Chocolate Bar Battler" or v.Name == "Cocoa Warrior") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        DoughKing_Farm_Name = v.Name
                                        DoughKing_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            Tween(CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625))
                            if (CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Cake Prince
local Other_Subs_Farm = Subs_Farm_Left:addMenu('#Raid Farm')

Other_Subs_Farm:addToggle('Auto Raid Factory', AutoFactory, function(Value)
    AutoFactory = Value
    CancelTween(AutoFactory)
end)
spawn(function()
    while task.wait() do
        if AutoFactory then
            if game.Workspace.Enemies:FindFirstChild("Core") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Core" and v.Humanoid.Health > 0 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                            EquipTool(SelectWeapon)
                            AutoClick()
                        until not v.Parent or v.Humanoid.Health <= 0  or AutoFactory == false
                    end
                end
            elseif game.ReplicatedStorage:FindFirstChild("Core") then
                repeat Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                    wait()
                until not AutoFactory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
            end
        end
    end
end)

Other_Subs_Farm:addToggle('Auto Raid Pirate', AutoPirateCastle, function(Value)
    AutoPirateCastle = Value
    CancelTween(AutoPirateCastle)
end)
spawn(function()
    while task.wait() do
        if AutoPirateCastle then
            pcall(function()
                local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        PirateCastle_Name = v.Name
                                        PirateCastle_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not AutoPirateCastle or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    end
                else
                    Tween(CFrameCastleRaid)
                end
            end)
        end
    end
end)
----------------------------------------------------//----------------------------------------------------
--// SUBS FARM Right
local Subs_Farm_Right = Tab.Tab_SubFarm:addSection()

--// MATERIAL FARM
local Material_Farm = Subs_Farm_Right:addMenu('#Material Farm')
if First_Sea then
    MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail"}
elseif Second_Sea then
    MaterialList = {"Scrap Metal","Leather","Radioactive Material","Mystic Droplet","Magma Ore","Vampire Fang"}
elseif Third_Sea then
    MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
end
Material_Farm:addDropdown('Select Material', SelectMaterial, MaterialList, function(Value)
    SelectMaterial = Value
end)

Material_Farm:addToggle('Auto Farm Material', Auto_Farm_Material, function(Value)
    Auto_Farm_Material = Value
    CancelTween(Auto_Farm_Material)
end)
spawn(function()
    while task.wait() do
        if Auto_Farm_Material then
            pcall(function()
                MaterialMon(SelectMaterial)
                if ByPassTP then
                    BTP(MPos)
                elseif not ByPassTP then
                    Tween(MPos)
                end
                for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if v.Name == MMon then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                Material_Farm_Name = v.Name
                                Material_Farm_CFrame = v.HumanoidRootPart.CFrame
                                AutoClick()
                            until not Auto_Farm_Material or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// CHEST FARM
local Chest_Farm = Subs_Farm_Right:addMenu('#Chest Farm')

function AutoGrabChest()
    local player = game.Players.LocalPlayer.Character
    for i,v in pairs(game.Workspace:GetChildren()) do 
        if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
            player.HumanoidRootPart.CFrame = v.CFrame
            wait(.15)
        end
    end
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if (v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3") and v:IsA("TouchTransmitter") then
            wait(.15)
            firetouchinterest(player.HumanoidRootPart, v.Parent, 0) -- 0 is touch
            wait(.15)
            firetouchinterest(player.HumanoidRootPart, v.Parent, 1) -- 1 is not touch
        end
    end
end

function CooldownDeath(times)
    wait(times)
    game.Players.LocalPlayer.Character.Head:Destroy()
    wait(times)
end

Chest_Farm:addToggle('Auto Grab Chest (Stop if have items)', _G.GrabChested, function(Value)
    _G.GrabChested = Value
end)
spawn(function()
    while task.wait() do
        if _G.GrabChested then
            pcall(function()
                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                    pcall(function()
                        AutoGrabChest()
                    end)
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.GrabChested then
            pcall(function()
                CooldownDeath(10)
            end)
        end
    end
end)

Chest_Farm:addToggle('Auto Grab Chest + Hop (Stop if have items)', _G.GrabChestedHop, function(Value)
    _G.GrabChestedHop = Value
end)
spawn(function()
    while wait() do
        if _G.GrabChestedHop then
            pcall(function()
                if game.Workspace:FindFirstChild("Chest1") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest3") then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                        pcall(function()
                            AutoGrabChest()
                        end)
                    end
                else
                    pcall(function()
                        Hop()
                    end)
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.GrabChestedHop then
            pcall(function()
                CooldownDeath(10)
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// OBSERVATION FARM
local Observation_Farm = Subs_Farm_Right:addMenu('#Observation Farm')
local ObservationRange = Observation_Farm:addLabel("")
spawn(function()
    while task.wait() do
        ObservationRange:Refresh("Observation Level : " .. tostring(game:GetService("Players").LocalPlayer.VisionRadius.Value))
    end
end)

Observation_Farm:addToggle("Auto Farm Observation", AutoFarmKen, function(Value)
    AutoFarmKen = Value
    CancelTween(AutoFarmKen)
end)
spawn(function()
    while task.wait() do
        if AutoFarmKen then
            pcall(function()
                if Second_Sea then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until AutoFarmKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                    wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until AutoFarmKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif First_Sea then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until AutoFarmKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until AutoFarmKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        Tween(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif Third_Sea then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until AutoFarmKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat game:GetService("RunService").Heartbeat:wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until AutoFarmKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        Tween(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end
            end)
        end
    end
end)

Observation_Farm:addToggle("Auto Observation V2", AutoKenV2, function(Value)
    AutoKenV2 = Value
    CancelTween(AutoKenV2)
end)
spawn(function()
    while task.wait() do
        if AutoKenV2 then
            pcall(function()
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and  game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
                        until not AutoKenV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
                        until not AutoKenV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                    else
                        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                            if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                                v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                                wait()
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
                                wait()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// QUEST LEFT
local Quest_Left = Tab.Tab_3:addSection()
local World_Quest = Quest_Left:addMenu('#World')
World_Quest:addToggle('Auto Second World [Lv. 700]', AutoSecondWorld, function(Value)
    AutoSecondWorld = Value
    CancelTween(AutoSecondWorld)
end)
spawn(function()
    while task.wait() do
        if AutoSecondWorld then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 700 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == false then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or not game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Key"])
                            if ByPassTP then
                                BTP(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
                                game:GetService("Workspace").Map.Ice.Door.Size = Vector3.new(30,30,30)
                            elseif not ByPassTP then
                                Tween(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
                                game:GetService("Workspace").Map.Ice.Door.Size = Vector3.new(30,30,30)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == true then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral" then
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                end
                            end
                            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                                if v.Name == "Ice Admiral" then
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                end
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == true then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                end
            end)
        end
    end
end)

World_Quest:addToggle('Auto Third World [Lv. 1500]', AutoThirdWorld, function(Value)
    AutoThirdWorld = Value
    CancelTween(AutoThirdWorld)
end)
spawn(function()
    while task.wait() do
        if AutoThirdWorld then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 1500 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == nil then
                                if game.Workspace.Enemies:FindFirstChild("rip_indra") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v.Name == "rip_indra" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat game:GetService("RunService").Heartbeat:wait()
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid:ChangeState(11)
                                                v.Humanoid:ChangeState(14)
                                                AutoClick()
                                            until not v.Parent or v.Humanoid.Health <= 0 or not AutoThirdWorld
                                        end
                                    end
                                else
                                    Tween(CFrame.new(-26952.2891, 21.5294781, 329.351562, -0.453972578, 0, -0.891015649, 0, 1, 0, 0.891015649, 0, -0.453972578))
                                end
                            elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
                                if game.Workspace.Enemies:FindFirstChild("Don Swan") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v.Name == "Don Swan" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat game:GetService("RunService").Heartbeat:wait()
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid:ChangeState(11)
                                                v.Humanoid:ChangeState(14)
                                                AutoClick()
                                            until not v.Parent or v.Humanoid.Health <= 0 or not AutoThirdWorld
                                        end
                                    end
                                else
                                    if ByPassTP then
                                        BTP(CFrame.new(2288.802, 15.1870775, 863.034607))
                                    else
                                        Tween(CFrame.new(2288.802, 15.1870775, 863.034607))
                                    end
                                end
                            end
                        
                            TabelDevilFruitStore = {}
                            TabelDevilFruitOpen = {}
                            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                                for i1,v1 in pairs(v) do
                                    if i1 == "Name" then
                                        table.insert(TabelDevilFruitStore,v1)
                                    end
                                end
                            end
                            for i,v in next,game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
                                if v.Price >= 1000000 then
                                    table.insert(TabelDevilFruitOpen,v.Name)
                                end
                            end
                            for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                                for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                                    if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                        if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",DevilFruitStore)
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
                                        end
                                    end
                                end
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == true then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Swan Pirate" then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            AutoClick()
                                        until not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not AutoThirdWorld
                                    end
                                end
                            else
                                if ByPassTP then
                                    BTP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                else
                                    Tween(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                end
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                        if game.Workspace.Enemies:FindFirstChild("Jeremy") then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Jeremy" then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            AutoClick()
                                        until not v.Parent or v.Humanoid.Health <= 0 or not AutoThirdWorld
                                    end
                                end
                            end
                        else
                            if ByPassTP then
                                BTP(CFrame.new(2099.88159, 448.931, 648.997375))
                            else
                                Tween(CFrame.new(2099.88159, 448.931, 648.997375))
                            end
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameThird.Position).Magnitude > 1500 then
                            if ByPassTP then
                                BTP(CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375))
                            else
                                Tween(CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375))
                            end
                        else
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                        end
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// FIGHTING
local Fighting_Quest = Quest_Left:addMenu("#Fighting")
Fighting_Quest:addToggle('Auto DeathStep', AutoDeathStep, function(Value)
    AutoDeathStep = Value
    CancelTween(AutoDeathStep)
    if AutoDeathStep then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoDeathStep then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
                    if game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
                        Tween(CFrame.new(6372.57275, 302.194611, -6838.97461, 0.838541508, -8.27643453e-05, 0.544837654, 8.27643453e-05, 1, 2.45265783e-05, -0.544837654, 2.45265783e-05, 0.838541508))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key") then
                            EquipTool("Library Key")
                            repeat task.wait()
                                if ByPassTP then
                                    BTP(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
                                else
                                    Tween(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) 
                                end
                            until (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not AutoDeathStep
                            if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                                wait(1.2)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                wait(0.5)
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            if v.Name == "Awakened Ice Admiral" then
                                                repeat game:GetService("RunService").Heartbeat:wait()
                                                    EquipTool(SelectWeapon)
                                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.Humanoid:ChangeState(11)
                                                    v.Humanoid:ChangeState(14)
                                                    AutoClick()
                                                until not v.Parent or v.Humanoid.Health <= 0 or AutoDeathStep == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
                                            end
                                        end
                                    end
                                end
                            else
                                if ByPassTP then
                                    BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
                                else
                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
                                end
                                
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end)
    end
end)

Fighting_Quest:addToggle('Auto SuperHuman', AutoSuperhuman, function(Value)
    AutoSuperhuman = Value
    CancelTween(AutoSuperhuman)
    if AutoSuperhuman then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
end)
spawn(function()
    while task.wait() do
        if AutoSuperhuman then
            pcall(function()
                if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        EquipTool("Superhuman")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            EquipTool("Black Leg")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            EquipTool("Electro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            EquipTool("Fishman Karate")
                        end
                        if game.Players.LocalPlayer.BackpacUnEquipWeaponk:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            EquipTool("Dragon Claw")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                        else
                            local Fragment = game:GetService("Players")["Localplayer"].Data.Fragments.Value
                            if Fragment <= 1499 then
                                AutoSuperhuman = true
                            else
                                AutoSuperhuman = false
                            end
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                    end
                end
            end)
        end
    end
end)

Fighting_Quest:addToggle('Auto Sharkman Karate', AutoSharkman, function(Value)
    AutoSharkman = Value
    CancelTween(AutoSharkman)
    if AutoSharkman then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoSharkman then
                if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                    Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                        repeat task.wait()
                            Tween(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) until (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not AutoSharkman
                        if (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                            wait(0.5)
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Tide Keeper" then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            AutoClick()
                                        until not v.Parent or v.Humanoid.Health <= 0 or AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
                                    end
                                end
                            end
                        else
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                end
            end
            
        end)
    end
end)

Fighting_Quest:addToggle('Auto Electric Claw', AutoElectricClaw, function(Value)
    AutoElectricClaw = Value
    CancelTween(AutoElectricClaw)
    if AutoElectricClaw then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
end)
spawn(function()
    while task.wait(.1) do
        if AutoElectricClaw then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                        Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                        if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                            wait(2)
                        end
                        wait(1)
                        Tween(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                        if (CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                        end
                        wait(1)
                        Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                        if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        end
                        wait(1)
                        Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                        if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                        end
                        wait(1)
                        Tween(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                        if (CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                        end
                        wait(1)
                        Tween(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                        if (CFrame.new(-10371.4717, 330.764496, -10131.4199).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        end
                        EquipTool("Electric Claw")
                        wait(.1)
                    end
                end
            end)
        end
    end
end)

Fighting_Quest:addToggle('Auto Dragon Talon', AutoDragonTalon, function(Value)
    AutoDragonTalon = Value
    CancelTween(AutoDragonTalon)
    if AutoDragonTalon then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end
end)
spawn(function()
    while task.wait(.1) do
        if AutoDragonTalon then
            pcall(function()
                if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        EquipTool("Dragon Claw")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        EquipTool("Dragon Claw")
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        end
                    end
                end
            end)
        end
    end
end)

Fighting_Quest:addToggle('Auto God Human', AutoGodhuman, function(Value)
    AutoGodhuman = Value
    CancelTween(AutoGodhuman)
    if AutoGodhuman then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
end)
function CheckMaterial(item)
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v) == "table" then
            if v.Type == "Material" then
                if v.Name == item then
                    return v.Count
                end
            end
        end
    end
end
spawn(function()
    while task.wait(.1) do
        if AutoGodhuman then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Superhuman" ,
							Icon = "http://www.roblox.com/asset/?id=",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Death Step" ,
							Icon = "http://www.roblox.com/asset/?id=",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have SharkMan Karate" ,
							Icon = "http://www.roblox.com/asset/?id=",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Electric Claw" ,
							Icon = "http://www.roblox.com/asset/?id=",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Enough Material" ,
									Icon = "http://www.roblox.com/asset/?id=",
									Duration = 2.5
								})
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
							end
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Dragon Talon" ,
							Icon = "http://www.roblox.com/asset/?id=",
							Duration = 2.5
						})
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")

				end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// SWORD QUEST
local Sword_Wuest = Quest_Left:addMenu('#Sword')
Sword_Wuest:addToggle('Auto Saber', AutoSaber, function(Value)
    AutoSaber = Value
    CancelTween(AutoSaber)
end)
spawn(function()
    while task.wait() do
        if AutoSaber and game.Players.LocalPlayer.Data.Level.Value >= 200 and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Saber") and not game.Players.LocalPlayer.Character:FindFirstChild("Saber") then
            pcall(function()
                if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                    if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                            wait(1)
                        else
                            Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                        end
                    else
                        if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                EquipTool("Torch")
                                Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                            else
                                Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                            end
                        else
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                wait(0.5)
                                EquipTool("Cup")
                                wait(0.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                wait(0)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") then
                                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                if v.Name == "Mob Leader" then
                                                    repeat game:GetService("RunService").Heartbeat:wait()
                                                        EquipTool(SelectWeapon)
                                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                        v.HumanoidRootPart.Transparency = 1
                                                        v.Humanoid:ChangeState(11)
                                                        v.Humanoid:ChangeState(14)
                                                        AutoClick()
                                                    until v.Humanoid.Health <= 0 or AutoSaber == false or not v.Parent
                                                end
                                            end
                                        end
                                    else
                                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame)
                                    end
                                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    wait(0.5)
                                    EquipTool("Relic")
                                    wait(0.5)
                                    Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                end
                            end
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Saber Expert" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until v.Humanoid.Health <= 0 or AutoSaber == false
                                    if v.Humanoid.Health <= 0 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                    end
                                end
                            end
                        end
                    else
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert").HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

Sword_Wuest:addToggle('Auto Legendary Sword', AutoLegendarySword, function(Value)
    AutoLegendarySword = Value
end)
spawn(function()
    while task.wait() do
        if AutoLegendarySword then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySworldDealer","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySworldDealer","2")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySworldDealer","2")
            end)
        end
    end
end)

Sword_Wuest:addToggle('Auto Rengoku', AutoRengoku, function(Value)
    AutoRengoku = Value
    CancelTween(AutoRengoku)
end)
spawn(function()
    while task.wait() do
        if AutoRengoku then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    EquipTool("Hidden Key")
                    loc1 = CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875)
                    if ByPassTP then
                        BTP(loc1)
                    else
                        Tween(loc1)
                    end
                elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Snow Lurker" or v.Name == "Arctic Warrior" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Rengoku_Farm_Name = v.Name
                                    Rengoku_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                end
            end)
        end
    end
end)

Sword_Wuest:addToggle('Auto Buddy Sword', AutoBuddySword, function(Value)
    AutoBuddySword = Value
    CancelTween(AutoBuddySword)
end)
spawn(function()
    while task.wait() do
        if AutoBuddySword then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Cake Queen [Lv. 2175] [Boss]" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until not AutoBuddySword or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)

Sword_Wuest:addToggle('Auto Pole', AutoPole, function(Value)
    AutoPole = Value
    CancelTween(AutoPole)
end)
spawn(function()
    while task.wait() do
        if AutoPole then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Thunder God" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until not AutoPole or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if ByPassTP then
                        BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame)
                    else
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

Sword_Wuest:addToggle('Auto Cavander', AutoCavander, function(Value)
    AutoCavander = Value
    CancelTween(AutoCavander)
end)
spawn(function()
    while task.wait() do
        if AutoCavander then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Beautiful Pirate" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until not AutoCavander or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if ByPassTP then
                        BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame)
                    else
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
Sword_Wuest:addToggle('Auto Yama', AutoYama, function(Value)
    AutoYama = Value
    CancelTween(AutoYama)
end)
spawn(function()
    while task.wait() do
        if AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                repeat task.wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not AutoYama
            end
        end
    end
end)

Sword_Wuest:addToggle('Auto Tushita', AutoTushita, function(Value)
    AutoTushita = Value
    CancelTween(AutoTushita)
end)

function autoTushita()
    if not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
        if game.Workspace.Enemies:FindFirstChild("Deandre") or game.Workspace.Enemies:FindFirstChild("Urban") or game.Workspace.Enemies:FindFirstChild("Diablo") or game.ReplicatedStorage:FindFirstChild("Deandre") or game.ReplicatedStorage:FindFirstChild("Urban") or game.ReplicatedStorage:FindFirstChild("Diablo") then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoTushita == false or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                end
            end
        else
            Tween(CFrame.new(-12554.9443, 337.194092, -7501.44727))
        end
    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
        wait(0.5)
        Tween(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
        wait(0.5)
        Tween(CFrame.new(-5414.41357, 309.865753, -2212.45776))
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
        wait(0.5)
        Tween(CFrame.new(-4971.47559, 331.565765, -3720.02954))
        wait(0.5)
        EquipTool("God's Chalice")
        wait(0.5)
        Tween(CFrame.new(-5560.27295, 313.915466, -2663.89795))
        wait(0.5)
        Tween(CFrame.new(-5561.37451, 313.342529, -2663.4948))
        wait(1)
        Tween(CFrame.new(5154.17676, 141.786423, 911.046326))
        wait(0.2)
        Tween(CFrame.new(5148.03613, 162.352493, 910.548218))
        wait(1)
        EquipTool("Holy Torch")
        wait(1)
        wait(0.4)
        Tween(CFrame.new(-10752.7695, 412.229523, -9366.36328))
        wait(0.4)
        Tween(CFrame.new(-11673.4111, 331.749023, -9474.34668))
        wait(0.4)
        Tween(CFrame.new(-12133.3389, 519.47522, -10653.1904))
        wait(0.4)
        Tween(CFrame.new(-13336.5, 485.280396, -6983.35254))
        wait(0.4)
        Tween(CFrame.new(-13487.4131, 334.84845, -7926.34863))
        wait(1)
        if game.Workspace.Enemies:FindFirstChild("Longma") or game.ReplicatedStorage:FindFirstChild("Longma") then
            Tween(CFrame.new(-10171.7051, 406.981995, -9552.31738))
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == "Longma" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    EquipTool(SelectWeapon)
                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    AutoClick()
                end
            end
        elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form")  or game.ReplicatedStorage:FindFirstChild("rip_indra True Form") then
            Tween(CFrame.new(-5332.30371, 423.985413, -2673.48218))
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == "rip_indra True Form" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    EquipTool(SelectWeapon)
                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                    AutoClick()
                end
            end
        end
    end
end
spawn(function()
    while task.wait() do
        if AutoTushita then
            pcall(function()
                autoTushita()
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// QUEST RIGHT
local Quest_Right = Tab.Tab_3:addSection()

local CDK_Quest_Puzzle = Quest_Right:addMenu('#CDK Puzzle')

local TushitaSword = CDK_Quest_Puzzle:addLabel("")
local YamaSword = CDK_Quest_Puzzle:addLabel("")

function GetWeaponInventory(Sword)
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v) == "table" then
            if v.Type == "Sword" then
                if v.Name == Sword then
                    return true
                end
            end
        end
    end
    return false
end

spawn(function()
    while task.wait() do
        if GetWeaponInventory("Tushita") == true then
            TushitaSword:Refresh("Tushita Sword : Have âœ…")
        elseif GetWeaponInventory("Tushita") == false then
            TushitaSword:Refresh("Tushita Sword : Not Have âŒ")
        end

        if GetWeaponInventory("Yama") == true then
            YamaSword:Refresh("Yama Sword : Have âœ…")
        elseif GetWeaponInventory("Yama") == false then
            YamaSword:Refresh("Yama Sword : Not Have âŒ")
        end
    end
end)

CDK_Quest_Puzzle:addLabel("Will Released Soon")

----------------------------------------------------//----------------------------------------------------
--// Other Quest
local Other_Quest = Quest_Right:addMenu('#Other')
Other_Quest:addToggle('Auto Dark Dagger', AutoDarkDagger, function(Value)
    AutoDarkDagger = Value
    CancelTween(AutoDarkDagger)
end)
spawn(function()
    while task.wait() do
        if AutoDarkDagger then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "rip_indra True Form" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    AutoClick()
                                until not AutoDarkDagger or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form").HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Hallow Sycthe', AutoHallowSycthe, function(Value)
    AutoHallowSycthe = Value
    CancelTween(AutoHallowSycthe)
end)
spawn(function()
    while task.wait() do
        if AutoHallowSycthe then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Soul Reaper" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until v.Humanoid.Health <= 0 or not AutoHallowSycthe or not v.Parent
                            end
                        end
                    end
                else
                    loc3 = CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat task.wait()
                            Tween(loc3)
                            wait()
                        until (loc3.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        EquipTool("Hallow Essence")
                    else
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Citizen', AutoCitizen, function(Value)
    AutoCitizen = Value
    CancelTween(AutoCitizen)
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Musketeer Hat") then
        CTCH = true
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Musketeer Hat") then
        CTCH = true
    end
    if CTCH and CheckCitizen then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Auto Quest Citizen",
            Text = "Musketeer Hat Successfully",
            Duration = 3
        })
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 and CheckCitizen then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Auto Quest Citizen",
            Text = "Citizen Quest Completed",
            Duration = 3
        })
    end
end)
spawn(function()
    while task.wait() do
        if AutoCitizen then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Forest Pirate" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Citizen_Farm_Name = v.Name
                                        Citizen_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until AutoCitizen == false or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        else
                            if ByPassTP then
                                BTP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                            else
                                Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                            end
                        end
                    else
                        Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                        if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoCitizen == false or v.Humanoid.Health <= 0 or not v.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not gamr:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        else
                            if ByPassTP then
                                BTP(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                            else
                                Tween(CFrame.new(-13459.065429688, 412.68927001953, -7783.1860351563))
                            end
                        end
                    else
                        Tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                        if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                    Tween(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Evo Race V2', AutoEvoRace, function(Value)
    AutoEvoRace = Value
    CancelTween(AutoEvoRace)
end)
spawn(function()
    while task.wait() do
        if AutoEvoRace then
            pcall(function()
                if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                        Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                        if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                            Tween(game.Workspace.Flower1.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                            Tween(game.Workspace.Flower2.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Zombie" then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                            EvoV2_Farm_Name = v.Name
                                            EvoV2_Farm_CFrame = v.HumanoidRootPart.CFrame
                                            AutoClick()
                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or AutoEvoRace == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            else
                                if ByPassTP then
                                    BTP(CFrame.new(-5854.39014, 145.093857, -686.942017, 0.379233211, -1.41975844e-08, -0.925301135, -3.77265719e-10, 1, -1.5498367e-08, 0.925301135, 6.2265797e-09, 0.379233211))
                                else
                                    Tween(CFrame.new(-5854.39014, 145.093857, -686.942017, 0.379233211, -1.41975844e-08, -0.925301135, -3.77265719e-10, 1, -1.5498367e-08, 0.925301135, 6.2265797e-09, 0.379233211))
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                    end
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Bartilo', AutoBartilo, function(Value)
    AutoBartilo = Value
    CancelTween(AutoBartilo)
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") then
        Success = true
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Warrior Helmet") then
        Success = true
    end
end)
spawn(function()
    while task.wait() do
        if AutoBartilo then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                        if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Swan Pirate" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        Bartilo_Farm_Name = v.Name
                                        Bartilo_Farm_CFrame = v.HumanoidRootPart.CFrame
                                        AutoClick()
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        else
                            if ByPassTP then
                                BTP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                            else
                                Tween(CFrame.new(1057.92761, 137.614319, 1242.08069))
                            end
                        end
                    else
                        Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                        if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                    if QuestBartilo == nil then
                        Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                    end
                    if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                        QuestBartilo = 1
                    end
                    if game.Workspace.Enemies:FindFirstChild("Jeremy") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Jeremy" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    else
                        Tween(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
                        if QuestBartilo == 1 then
                            Tween(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                    Tween(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
                    wait(1)
                end
            end)
        end 
    end
end)

Other_Quest:addToggle('Auto Don Swan', _G.SwanGlasses, function(Value)
    _G.SwanGlasses = Value
    CancelTween(_G.SwanGlasses)
end)
spawn(function()
    while task.wait() do
        if _G.SwanGlasses then
            if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Don Swan" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            EquipTool(SelectWeapon)
                            Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                            AutoClick()
                        until _G.SwanGlasses == false or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            else
                if ByPassTP then
                    BTP(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
                else
                    Tween(CFrame.new(2191.1674804688, 15.177842140198, 694.69873046875))
                end
            end
        end
    end
end)

Other_Quest:addToggle('Auto RIP Indra', RipIndra, function(Value)
    RipIndra = Value
    CancelTween(RipIndra)
end)
spawn(function()
    while task.wait() do
        if RipIndra then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "rip_indra True Form" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    AutoClick()
                                until v.Humanoid.Health <= 0 or not RipIndra or not v.Parent
                            end
                        end
                    end
                else
                    loc11 = CFrame.new(-5524.53271, 313.800537, -2918.07422, 0.964194059, 0, 0.265197694, 0, 1, 0, -0.265197694, 0, 0.964194059)
                    Tween(loc11)
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Rainbow', AutoRainbowHaki, function(Value)
    AutoRainbowHaki = Value
    CancelTween(AutoRainbowHaki)
end)
spawn(function()
    while task.wait() do
        if AutoRainbowHaki then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    loc12 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                    if ByPassTP then
                        BTP(loc12)
                    else
                        Tween(loc12)
                    end
                    if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Stone") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Stone" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoRainbowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Stone") then
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Stone").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Stone").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Island Empress") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Island Empress" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoRainbowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress") then
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Kilo Admiral") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Kilo Admiral" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoRainbowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Kilo Admiral") then
                            
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Kilo Admiral").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Kilo Admiral").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Captain Elephant") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Captain Elephant" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoRainbowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                            
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Beautiful Pirate") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name == "Beautiful Pirate" then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        EquipTool(SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid:ChangeState(14)
                                        AutoClick()
                                    until AutoRainbowHaki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                            
                            if ByPassTP then
                                BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame)
                            else
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame)
                            end
                        end
                    end
                else
                    loc17 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                    if ByPassTP then
                        BTP(loc17)
                    else
                        Tween(loc17)
                    end
                    if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                    end
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Holytorch', AutoTorch, function(Value)
    AutoTorch = Value
    CancelTween(AutoTorch)
end)
spawn(function()
    while wait() do
        if AutoTorch then
            pcall(function()
                wait(1)
                repeat Tween(CFrame.new(-10752, 417, -9366)) wait() until not AutoTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
                wait(1)
                repeat Tween(CFrame.new(-11672, 334, -9474)) wait() until not AutoTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
                wait(1)
                repeat Tween(CFrame.new(-12132, 521, -10655)) wait() until not AutoTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                wait(1)
                repeat Tween(CFrame.new(-13336, 486, -6985)) wait() until not AutoTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                wait(1)
                repeat Tween(CFrame.new(-13489, 332, -7925)) wait() until not AutoTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Soul Guitar', AutoSoulGuitar, function(Value)
    AutoSoulGuitar = Value
    CancelTween(AutoSoulGuitar)
end)
spawn(function()
    while task.wait() do
        if AutoSoulGuitar then
            pcall(function()
                if GetWeaponInventory("Soul Guitar") == false then
                    if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
                        else
                            if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
                                if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
                                    Quest2 = true
                                    repeat task.wait() 
                                        Tween(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875)) 
                                    until (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not AutoSoulGuitar
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                                    wait(1)
                                elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                    if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                        Quest4 = true
                                        repeat task.wait() 
                                            Tween(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625)) 
                                        until (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not AutoSoulGuitar
                                        wait(1)
                                        Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                                        wait(1)
                                        Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                        wait(1)
                                        Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                        wait(1)
                                        Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                                        wait(1)
                                        Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                        wait(1)
                                        fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    else
                                        Quest3 = true
                                        --Not Work Yet
                                    end
                                else
                                    if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                        local args = {
                                            [1] = "GuitarPuzzleProgress",
                                            [2] = "Ghost"
                                        }

                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                if v.Name == "Living Zombie" then
                                                    repeat game:GetService("RunService").Heartbeat:wait()
                                                        EquipTool(SelectWeapon)
                                                        Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                        v.HumanoidRootPart.Transparency = 1
                                                        v.Humanoid:ChangeState(11)
                                                        v.Humanoid:ChangeState(14)
                                                        SoulGuitar_Farm_Name = v.Name
                                                        SoulGuitar_Farm_CFrame = v.HumanoidRootPart.CFrame
                                                        AutoClick()
                                                    until v.Humanoid.Health <= 0 or not v.Parent or not AutoSoulGuitar
                                                end
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                                    end
                                end
                            else    
                                if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
                                    print("Go to Grave")
                                    Tween(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
                                elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
                                    print("Wait Next Night")
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
                                end
                            end
                        end
                    else
                        Tween(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
                    end
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Tryluck Gravestone', AutoTryLuck, function(Value)
    AutoTryLuck = Value
    CancelTween(AutoTryLuck)
end)
spawn(function()
    while wait(.1) do
        if AutoTryLuck then
            if ByPassTP then
                BTP(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
            else
                Tween(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
            end
            wait(2)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",1)
        end
    end
end)

Other_Quest:addToggle('Auto Pray Gravestone', AutoPray, function(Value)
    AutoPray = Value
    CancelTween(AutoPray)
end)
spawn(function()
    while wait(.1) do
        if AutoPray then
            if ByPassTP then
                BTP(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
            else
                Tween(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
            end
            wait(2)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2)
        end
    end
end)

Other_Quest:addToggle('Auto Advanced Dungeon', AutoAdvanceDungeon, function(Value)
    AutoAdvanceDungeon = Value
    CancelTween(AutoAdvanceDungeon)
end)
spawn(function()
    while wait() do
        if AutoAdvanceDungeon then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                            Tween(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                            end
                        end
                    elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                        if game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                            Tween(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                            end
                        end
                    end
                end
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Enchancement Haki', AutoColorHaki, function(Value)
    AutoColorHaki = Value
end)
spawn(function()
    while task.wait() do
        if AutoColorHaki then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
            end)
        end
    end
end)

Other_Quest:addToggle('Auto Musketer', AutoMusketeer, function(Value)
    AutoMusketeer = Value
    CancelTween(AutoMusketeer)
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoMusketeer then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    repeat 
                        Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
                        wait(2) 
                    until not AutoMusketeer or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Forest Pirate" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    Musketere_Farm_Name = v.Name
                                    Musketere_Farm_CFrame = v.HumanoidRootPart.CFrame
                                    AutoClick()
                                until not AutoMusketeer or v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    else
                        Tween(game.ReplicatedStorage:FindFirstChild('Forest Pirate').HumanoidRootPart.CFrame)
                    end
                end
            end
        end)
    end
end)

Other_Quest:addToggle('Auto Serpent Bow', Auto_Serpent_Bow, function(Value)
    Auto_Serpent_Bow = Value
    CancelTween(Auto_Serpent_Bow)
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if Auto_Serpent_Bow then
                if game.Workspace.Enemies:FindFirstChild("Island Empress") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Island Empress" then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * Farm_Mode)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                    AutoClick()
                                until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Serpent_Bow
                            end
                        end
                    end
                else
                    Tween(game.ReplicatedStorage:FindFirstChild("Island Empress").HumanoidRootPart.CFrame)
                end       
            end
        end)
    end
end)

----------------------------------------------------//----------------------------------------------------
--// RAIDBOUNTY Left
local Raid_Left = Tab.Tab_4:addSection()

--// Law Raid
local Law_Raids = Raid_Left:addMenu('#Law Raids')

local RaidWeaponList = {"Melee", "Sword", "Blox Fruit", "Gun"}
Law_Raids:addDropdown("Select Weapon", RaidSelectedWeapon, RaidWeaponList, function(Value)
    RaidSelectedWeapon = Value
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if RaidSelectedWeapon == "Melee" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponRaid = v.Name
                        end
                    end
                end
            elseif RaidSelectedWeapon == "Sword" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponRaid = v.Name
                        end
                    end
                end
            elseif RaidSelectedWeapon == "Blox Fruit" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponRaid = v.Name
                        end
                    end
                end
            elseif RaidSelectedWeapon == "Gun" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponRaid = v.Name
                        end
                    end
                end
            end
        end)
    end
end)

DisRaid = 70
Law_Raids:addTextbox("Distance Farm", DisRaid, function(Value)
    DisRaid = Value
end)

Law_Raids:addToggle("Buy Law Chips", Auto_Buy_Law_Chip, function(Value)
    Auto_Buy_Law_Chip = Value
end)
spawn(function()
    while wait() do
        if Auto_Buy_Law_Chip then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Workspace").Enemies:FindFirstChild("Order") or game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                
            else
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "Microchip",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

Law_Raids:addToggle("Start Law Raid", Auto_Start_Law_Dungeon, function(Value)
    Auto_Start_Law_Dungeon = Value
end)
spawn(function()
    while wait() do
        if Auto_Start_Law_Dungeon then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end
            end)
        end
    end
end)

Law_Raids:addToggle('Auto Kill Law Raid', BossRaid, function(Value)
    BossRaid = Value
    CancelTween(BossRaid)
end)
spawn(function()
    while task.wait() do
        if BossRaid then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Order" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            EquipTool(SelectWeaponRaid)
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not BossRaid or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == "Order" then
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// RAIDBOUNTY RIGHT
local Raid_Right = Tab.Tab_4:addSection()

local Raids = Raid_Right:addMenu('#Raids')

local Chips = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}

Raids:addDropdown("Select Chips", SelectChip, Chips, function(Value)
    SelectChip = Value
end)

Raids:addToggle("Auto Buy Microchips", AutoBuySpecialChip, function(Value)
    AutoBuySpecialChip = Value
end)
spawn(function()
    while task.wait() do
        if AutoBuySpecialChip then
            if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectChip)
            end
        end
    end
end)

Raids:addToggle("Auto Start Raids", AutoSTartRaids, function(Value)
    AutoSTartRaids = Value
end)
spawn(function()
    while task.wait() do
        if AutoSTartRaids then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
                if Second_Sea then
                    fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif Third_Sea then
                    fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end
    end
end)

Raids:addToggle('Kill Raid Aura', RaidAura, function(Value)
    RaidAura = Value
end)
spawn(function()
    game:GetService('RunService').Heartbeat:Connect(function()
        if RaidAura then
            pcall(function()
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    EquipTool(SelectWeaponRaid)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                                until not RaidAura or not v.Parent or not game.Workspace.Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Raids:addToggle('Auto Next Island', AutoNextIsland, function(Value)
    AutoNextIsland = Value
    CancelTween(AutoNextIsland)
end)
spawn(function()
    while wait() do
        if AutoNextIsland then
            if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                wait(5)
                if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                    Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,DisRaid,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                    Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,DisRaid,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                    Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,DisRaid,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                    Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,DisRaid,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                    Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,DisRaid,0))
                end
            end
        end
    end
end)

Raids:addToggle('Auto Awaken', AutoAwakenAbilities, function(Value)
    AutoAwakenAbilities = Value
end)
spawn(function()
    while wait() do
        if AutoAwakenAbilities then
            local args1 = {
                [1] = "Awakener",
                [2] = "Check"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))
            local args2 = {
                [1] = "Awakener",
                [2] = "Awaken"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// PVP LEFT
local Pvp_Left = Tab.Tab_Combat:addSection()

local Setting_Pvp = Pvp_Left:addMenu('#Setting Pvp')

local Current = Setting_Pvp:addLabel("Current Bounties : ")
local Earn = Setting_Pvp:addLabel("Earned : ")

local OldBounty = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
local Bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
local Earned = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value - OldBounty)
local sub = string.sub 
local len = string.len

spawn(function()
    while wait() do
        pcall(function()
            if len(Bounty) == 4 then
                Bounty1 = sub(Bounty,1,1).."."..sub(Bounty,2,3).."K"
            elseif len(Bounty) == 5 then
                Bounty1 = sub(Bounty,1,2).."."..sub(Bounty,3,4).."K"
            elseif len(Bounty) == 6 then
                Bounty1 = sub(Bounty,1,3).."."..sub(Bounty,4,5).."K"
            elseif len(Bounty) == 7 then
                Bounty1 = sub(Bounty,1,1).."."..sub(Bounty,2,3).."M"
            elseif len(Bounty) == 8 then
                Bounty1 = sub(Bounty,1,2).."."..sub(Bounty,3,4).."M"
            elseif len(Bounty) <= 3 then
                Bounty1 = Bounty
            end

            if len(Earned) == 4 then
                Earned1 = sub(Earned,1,1).."."..sub(Earned,2,3).."K"
            elseif len(Earned) == 5 then
                Earned1 = sub(Earned,1,2).."."..sub(Earned,3,4).."K"
            elseif len(Earned) == 6 then
                Earned1 = sub(Earned,1,3).."."..sub(Earned,4,5).."K"
            elseif len(Earned) == 7 then
                Earned1 = sub(Earned,1,1).."."..sub(Earned,2,3).."M"
            elseif len(Earned) == 8 then
                Earned1 = sub(Earned,1,2).."."..sub(Earned,3,4).."M"
            elseif len(Earned) <= 3 then
                Earned1 = Earned
            end
            if tonumber(Bounty) == 25000000 then
                Current:Refresh("Current Bounties : "..Bounty1.." [ Max ]")
            elseif tonumber(Bounty) < 25000000 then
                Current:Refresh("Current Bounties : "..Bounty1)
            end
            Earn:Refresh("Earned : "..tonumber(Earned1))
        end)
    end
end)

local PvpWeaponList = {"Melee", "Sword", "Blox Fruit", "Gun"}
Setting_Pvp:addDropdown("Select Weapon", PvpSelectedWeapon, PvpWeaponList, function(Value)
    PvpSelectedWeapon = Value
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if PvpSelectedWeapon == "Melee" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponPvp = v.Name
                        end
                    end
                end
            elseif PvpSelectedWeapon == "Sword" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponPvp = v.Name
                        end
                    end
                end
            elseif PvpSelectedWeapon == "Blox Fruit" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponPvp = v.Name
                        end
                    end
                end
            elseif PvpSelectedWeapon == "Gun" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            SelectWeaponPvp = v.Name
                        end
                    end
                end
            end
        end)
    end
end)

local PvpTable = {
    "Above",
    "Bellow",
    "Behind"
}
AutoPvpType = "Behind"
Setting_Pvp:addDropdown("Select Pvp Type", AutoPvpType, PvpTable, function(Value)
    AutoPvpType = Value
end)
spawn(function()
    while wait() do
        if AutoPvpType == "Above" then
            Pvp_Mode = CFrame.new(0,DisPvp,0) * CFrame.Angles(math.rad(-90),0,0)
        elseif AutoPvpType == "Bellow" then
            Pvp_Mode = CFrame.new(0,DisPvp,0) * CFrame.Angles(math.rad(90),0,0)
        elseif AutoPvpType == "Behind" then
            Pvp_Mode = CFrame.new(0,0,DisPvp) * CFrame.Angles(math.rad(0),0,0)
        end
    end
end)

DisPvp = 10
Setting_Pvp:addTextbox("Distance Pvp", DisPvp, function(Value)
    DisPvp = Value
end)

Setting_Pvp:addToggle("Player ESP", _G.ESPPlayer, function(Value)
    _G.ESPPlayer = Value
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.ESPPlayer then
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if not v.Character.HumanoidRootPart:FindFirstChild("PlayerESP") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v.Character.HumanoidRootPart
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "PlayerESP"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
						    TextLabel.FontSize = "Size14"
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.Text.Size = 35
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                        v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.Text = v.DisplayName.."\n\n"..Dis.." M."
                        if v.Team == game.Players.LocalPlayer.Team then
                            v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.TextColor3 = Color3.new(255,0,0)
                        else
                            v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.TextColor3 = Color3.new(0,255,0)
                        end
                    end
                end
            else
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if v.Character.HumanoidRootPart:FindFirstChild("PlayerESP") then
                            v.Character.HumanoidRootPart.PlayerESP:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

Setting_Pvp:addToggle("Enable Pvp", EnablePVP, function(Value)
    EnablePVP = Value
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if EnablePVP then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)
----------------------------------------------------//----------------------------------------------------
--// PVP RIGHT
local Pvp_Right = Tab.Tab_Combat:addSection()

local Main_Pvp = Pvp_Right:addMenu("#Combat Player")

local PlayerList = {}
for i,v in pairs(game.Players:GetChildren()) do  
	if v.Name ~= game.Players.LocalPlayer.Name then
		table.insert(PlayerList, v.DisplayName)
	end
end
local DropdownPlayer = Main_Pvp:addDropdown("Select Player", SelectedPlayer, PlayerList, function(Value)
    SelectedPlayer = Value
end)
Main_Pvp:addButton("Refresh Player",function()
	NewPlayerList = {}
	for i,v in pairs(game.Players:GetChildren()) do  
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(NewPlayerList, v.DisplayName)
        end
    end
	DropdownPlayer:Clear()
	DropdownPlayer:Refresh(NewPlayerList)
end)
task.spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(game.Players:GetChildren()) do  
                if v.DisplayName == SelectedPlayer then
                    SelectedPlayer = v.Name
                end
            end
        end)
    end
end)

Main_Pvp:addToggle("Spectate Player", Spectate, function(value)
	Spectate = value
	local plr1 = game.Players.LocalPlayer.Character.Humanoid
	local plr2 = game.Players:FindFirstChild(SelectedPlayer)
	repeat task.wait()
		game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
	until Spectate == false 
	game.Workspace.Camera.CameraSubject = plr1
end)

Main_Pvp:addToggle("Combat Player", TweenToPlayer, function(Value)
    TweenToPlayer = Value
    CancelTween(TweenToPlayer)
end)
spawn(function()
    while task.wait() do
        if TweenToPlayer then
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        if v.Name == SelectedPlayer then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeaponPvp)
                                Tween(v.Character.HumanoidRootPart.CFrame * Pvp_Mode)
                                Player_Name = v.Name
                                Player_Position = v.Character.HumanoidRootPart.Position
                                AutoClick()
                            until not TweenToPlayer or v.Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(v.Name)
                        end
                    end
                end
            end)
        end
    end
end)

Main_Pvp:addToggle("Aimbot Skill", AimbotSkillPlayer, function(Value)
    AimbotSkillPlayer = Value
end)

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if AimbotSkillPlayer then
                        if type(args[2]) == "vector" then
                            args[2] = Player_Position
                        else
                            args[2] = CFrame.new(Player_Position)
                        end
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)

spawn(function()
    while task.wait() do
        if AimbotSkillPlayer then 
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name == Player_Name and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        Player_Position = v.Character.HumanoidRootPart.Position
                        repeat game:GetService("RunService").Heartbeat:wait()
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponPvp) then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponPvp).MousePos.Value = Player_Position
                                if PvpSkillZ then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                                if PvpSkillX then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                if PvpSkillC then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                                if PvpSkillV then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                    wait(.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end
                            end
                        until not AimbotSkillPlayer or v.Character.Humanoid.Health == 0 or not game.Players:FindFirstChild(v.Name)
                    end
                end
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// PVP RIGHT

local Skill_Pvp = Pvp_Right:addMenu("#Skill Setting")

Skill_Pvp:addToggle('Skill Z', PvpSkillZ, function(Value)
    PvpSkillZ = Value
end)

Skill_Pvp:addToggle('Skill X', PvpSkillX, function(Value)
    PvpSkillX = Value
end)

Skill_Pvp:addToggle('Skill C', PvpSkillC, function(Value)
    PvpSkillC = Value
end)

Skill_Pvp:addToggle('Skill V', PvpSkillV, function(Value)
    PvpSkillV = Value
end)

----------------------------------------------------//----------------------------------------------------
--// TELEPORTSTATUS LEFT
local TeleportStatus_Left = Tab.Tab_5:addSection()
local Teleport_World = TeleportStatus_Left:addMenu('#World Teleport')
Teleport_World:addButton("Travel to First Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
    
Teleport_World:addButton("Travel to Second Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
    
Teleport_World:addButton("Travel to Third Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

----------------------------------------------------//----------------------------------------------------
--// Island Teleport
local Island_Teleport = TeleportStatus_Left:addMenu('#Island Teleport')
if First_Sea then
    IslandCheck = {
        "Start Island";
        "Marine Start";
        "Middle Town";
        "Jungle";
        "Pirate Village";
        "Desert";
        "Frozen Village";
        "Marine Ford";
        "Colosseum 1";
        "Sky island 1";
        "Sky island 2";
        "Sky island 3";
        "Sky island 4";
        "Prison";
        "Magma Village";
        "UndeyWater City";
        "Fountain City";
        "House Cyborgs";
        "Shanks Room";
        "Mob Island";
        "Sea Beast";
    }
elseif Second_Sea then
    IslandCheck = {
        "Dock";
        "Kingdom of Rose";
        "Mansion 1";
        "Flamingo Room";
        "Green Zone";
        "Cafe";
        "Factory";
        "Colosseum 2";
        "Grave Island";
        "Snow Mountain";
        "Cold Island";
        "Hot Island";
        "Cursed Ship";
        "Ice Castle";
        "Forgotten Island";
        "Usoapp Island";
        "Minisky Island";
        "Sea Beast";
    }
elseif Third_Sea then
    IslandCheck = {
        "Port Town";
        "Hydra Island";
        "Great Tree";
        "Castle on the Sea";
        "Floating Turtle";
        "Mansion 2";
        "Secret Temple";
        "Friendly Arena";
        "Beautiful Pirate Domain";
        "Teler Park";
        "Peanut Island";
        "Chocolate Island";
        "Ice Cream Island";
        "Haunted Castle";
        "Cake Loaf";
        "Candy Cane";
        "Tiki Outpost";
        "Raid Lab";
        "Mini Sky";
        "Sea Beast";
    }
end
Island_Teleport:addDropdown("Select Island", SelectedIsland, IslandCheck, function(Value)
    SelectedIsland = Value
end)

Island_Teleport:addButton("Teleport to Island", function()
    if SelectedIsland == "Start Island" then
        if BypassTeleport then
            BTP(CFrame.new(1071.2832, 16.3085976, 1426.86792))
        else
            Tween(CFrame.new(1071.2832, 16.3085976, 1426.86792))
        end
    elseif SelectedIsland == "Marine Start" then
        if BypassTeleport then
            BTP(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
        else
            Tween(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
        end
    elseif SelectedIsland == "Middle Town" then
        if BypassTeleport then
            BTP(CFrame.new(-655.824158, 7.88708115, 1436.67908))
        else
            Tween(CFrame.new(-655.824158, 7.88708115, 1436.67908))
        end
    elseif SelectedIsland == "Jungle" then
        if BypassTeleport then
            BTP(CFrame.new(-1249.77222, 11.8870859, 341.356476))
        else
            Tween(CFrame.new(-1249.77222, 11.8870859, 341.356476))
        end
    elseif SelectedIsland == "Pirate Village" then
        if BypassTeleport then
            BTP(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
        else
            Tween(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
        end
    elseif SelectedIsland == "Desert" then
        if BypassTeleport then
            BTP(CFrame.new(1094.14587, 6.47350502, 4192.88721))
        else
            Tween(CFrame.new(1094.14587, 6.47350502, 4192.88721))
        end
    elseif SelectedIsland == "Frozen Village" then
        if BypassTeleport then
            BTP(CFrame.new(1198.00928, 27.0074959, -1211.73376))
        else
            Tween(CFrame.new(1198.00928, 27.0074959, -1211.73376))
        end
    elseif SelectedIsland == "Marine Ford" then
        if BypassTeleport then
            BTP(CFrame.new(-4505.375, 20.687294, 4260.55908))
        else
            Tween(CFrame.new(-4505.375, 20.687294, 4260.55908))
        end
    elseif SelectedIsland == "Colosseum 1" then
        if BypassTeleport then
            BTP(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
        else
            Tween(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
        end
    elseif SelectedIsland == "Sky island 1" then
        if BypassTeleport then
            BTP(CFrame.new(-4970.21875, 717.707275, -2622.35449))
        else
            Tween(CFrame.new(-4970.21875, 717.707275, -2622.35449))
        end
    elseif SelectedIsland == "Sky island 2" then
        if BypassTeleport then
            BTP(CFrame.new(-4813.0249, 903.708557, -1912.69055))
        else
            Tween(CFrame.new(-4813.0249, 903.708557, -1912.69055))
        end
    elseif SelectedIsland == "Sky island 3" then
        if BypassTeleport then
            BTP(CFrame.new(-7952.31006, 5545.52832, -320.704956))
        else
            Tween(CFrame.new(-7952.31006, 5545.52832, -320.704956))
        end
    elseif SelectedIsland == "Sky island 4" then
        if BypassTeleport then
            BTP(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
        else
            Tween(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
        end
    elseif SelectedIsland == "Prison" then
        if BypassTeleport then
            BTP(CFrame.new(4854.16455, 5.68742752, 740.194641))
        else
            Tween(CFrame.new(4854.16455, 5.68742752, 740.194641))
        end
    elseif SelectedIsland == "Magma Village" then
        if BypassTeleport then
            BTP(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
        else
            Tween(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
        end
    elseif SelectedIsland == "UndeyWater City" then
        if BypassTeleport then
            BTP(CFrame.new(61163.8516, 11.7796879, 1819.78418))
        else
            Tween(CFrame.new(61163.8516, 11.7796879, 1819.78418))
        end
    elseif SelectedIsland == "Fountain City" then
        if BypassTeleport then
            TP2(CFrame.new(5132.7124, 4.53632832, 4037.8562))
        else
            Tween(CFrame.new(5132.7124, 4.53632832, 4037.8562))
        end
    elseif SelectedIsland == "House Cyborgs" then
        if BypassTeleport then
            BTP(CFrame.new(6262.72559, 71.3003616, 3998.23047))
        else
            Tween(CFrame.new(6262.72559, 71.3003616, 3998.23047))
        end
    elseif SelectedIsland == "Shanks Room" then
        if BypassTeleport then
            BTP(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
        else
            Tween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
        end
    elseif SelectedIsland == "Mob Island" then
        if BypassTeleport then
            BTP(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
        else
            Tween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
        end
    elseif SelectedIsland == "Dock" then
        if BypassTeleport then
            BTP(CFrame.new(82.9490662, 18.0710983, 2834.98779))
        else
            Tween(CFrame.new(82.9490662, 18.0710983, 2834.98779))
        end
    elseif SelectedIsland == "Kingdom of Rose" then
        if BypassTeleport then
            BTP(CFrame.new(-394.983521, 118.503128, 1245.8446))
        else
            Tween(CFrame.new(-394.983521, 118.503128, 1245.8446))
        end
    elseif SelectedIsland == "Mansion 1" then
        if BypassTeleport then
            BTP(CFrame.new(-390.096313, 331.886475, 673.464966))
        else
            Tween(CFrame.new(-390.096313, 331.886475, 673.464966))
        end
    elseif SelectedIsland == "Flamingo Room" then
        if BypassTeleport then
            BTP(CFrame.new(2302.19019, 15.1778421, 663.811035))
        else
            Tween(CFrame.new(2302.19019, 15.1778421, 663.811035))
        end
    elseif SelectedIsland == "Green Zone" then
        if BypassTeleport then
            BTP(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
        else
            Tween(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
        end
    elseif SelectedIsland == "Cafe" then
        if BypassTeleport then
            BTP(CFrame.new(-385.250916, 73.0458984, 297.388397))
        else
            Tween(CFrame.new(-385.250916, 73.0458984, 297.388397))
        end
    elseif SelectedIsland == "Factory" then
        if BypassTeleport then
            BTP(CFrame.new(430.42569, 210.019623, -432.504791))
        else
            Tween(CFrame.new(430.42569, 210.019623, -432.504791))
        end
    elseif SelectedIsland == "Colosseum 2" then
        if BypassTeleport then
            BTP(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
        else
            Tween(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
        end
    elseif SelectedIsland == "Grave Island" then
        if BypassTeleport then
            BTP(CFrame.new(-5411.47607, 48.8234024, -721.272522))
        else
            Tween(CFrame.new(-5411.47607, 48.8234024, -721.272522))
        end
    elseif SelectedIsland == "Snow Mountain" then
        if BypassTeleport then
            BTP(CFrame.new(511.825226, 401.765198, -5380.396))
        else
            Tween(CFrame.new(511.825226, 401.765198, -5380.396))
        end
    elseif SelectedIsland == "Cold Island" then
        if BypassTeleport then
            BTP(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
        else
            Tween(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
        end
    elseif SelectedIsland == "Hot Island" then
        if BypassTeleport then
            BTP(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
        else
            Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
        end
    elseif SelectedIsland == "Cursed Ship" then
        if BypassTeleport then
            BTP(CFrame.new(902.059143, 124.752518, 33071.8125))
        else
            Tween(CFrame.new(902.059143, 124.752518, 33071.8125))
        end
    elseif SelectedIsland == "Ice Castle" then
        if BypassTeleport then
            BTP(CFrame.new(5400.40381, 28.21698, -6236.99219))
        else
            Tween(CFrame.new(5400.40381, 28.21698, -6236.99219))
        end
    elseif SelectedIsland == "Forgotten Island" then
        if BypassTeleport then
            BTP(CFrame.new(-3043.31543, 238.881271, -10191.5791))
        else
            Tween(CFrame.new(-3043.31543, 238.881271, -10191.5791))
        end
    elseif SelectedIsland == "Usoapp Island" then
        if BypassTeleport then
            BTP(CFrame.new(4748.78857, 8.35370827, 2849.57959))
        else
            Tween(CFrame.new(4748.78857, 8.35370827, 2849.57959))
        end
    elseif SelectedIsland == "Minisky Island" then
        if BypassTeleport then
            BTP(CFrame.new(-260.358917, 49325.7031, -35259.3008))
        else
            Tween(CFrame.new(-260.358917, 49325.7031, -35259.3008))
        end
    elseif SelectedIsland == "Port Town" then
        if BypassTeleport then
            BTP(CFrame.new(-610.309692, 57.8323097, 6436.33594))
        else
            Tween(CFrame.new(-610.309692, 57.8323097, 6436.33594))
        end
    elseif SelectedIsland == "Hydra Island" then
        if BypassTeleport then
            BTP(CFrame.new(5229.99561, 603.916565, 345.154022))
        else
            Tween(CFrame.new(5229.99561, 603.916565, 345.154022))
        end
    elseif SelectedIsland == "Great Tree" then
        if BypassTeleport then
            BTP(CFrame.new(2174.94873, 28.7312393, -6728.83154))
        else
            Tween(CFrame.new(2174.94873, 28.7312393, -6728.83154))
        end
    elseif SelectedIsland == "Castle on the Sea" then
        if BypassTeleport then
            BTP(CFrame.new(-5477.62842, 313.794739, -2808.4585))
        else
            Tween(CFrame.new(-5477.62842, 313.794739, -2808.4585))
        end
    elseif SelectedIsland == "Floating Turtle" then
        if BypassTeleport then
            BTP(CFrame.new(-10919.2998, 331.788452, -8637.57227))
        else
            Tween(CFrame.new(-10919.2998, 331.788452, -8637.57227))
        end
    elseif SelectedIsland == "Mansion 2" then
        if BypassTeleport then
            BTP(CFrame.new(-12553.8125, 332.403961, -7621.91748))
        else
            Tween(CFrame.new(-12553.8125, 332.403961, -7621.91748))
        end
    elseif SelectedIsland == "Secret Temple" then
        if BypassTeleport then
            BTP(CFrame.new(5217.35693, 6.56511116, 1100.88159))
        else
            Tween(CFrame.new(5217.35693, 6.56511116, 1100.88159))
        end
    elseif SelectedIsland == "Friendly Arena" then
        if BypassTeleport then
            BTP(CFrame.new(5220.28955, 72.8193436, -1450.86304))
        else
            Tween(CFrame.new(5220.28955, 72.8193436, -1450.86304))
        end
    elseif SelectedIsland == "Beautiful Pirate Domain" then
        if BypassTeleport then
            BTP(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
        else
            Tween(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
        end
    elseif SelectedIsland == "Teler Park" then
        if BypassTeleport then
            BTP(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
        else
            Tween(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
        end
    elseif SelectedIsland == "Peanut Island" then
        if BypassTeleport then
            BTP(CFrame.new(-2142, 48, -10031))
        else
            Tween(CFrame.new(-2142, 48, -10031))
        end
    elseif SelectedIsland == "Chocolate Island" then
        if BypassTeleport then
            BTP(CFrame.new(156.896484, 30.5935211, -12662.7031, -0.573599219, 0, 0.81913656, 0, 1, 0, -0.81913656, 0, -0.573599219))
        else
            Tween(CFrame.new(156.896484, 30.5935211, -12662.7031, -0.573599219, 0, 0.81913656, 0, 1, 0, -0.81913656, 0, -0.573599219))
        end
    elseif SelectedIsland == "Ice Cream Island" then
        if BypassTeleport then
            BTP(CFrame.new(-949, 59, -10907))
        else
            Tween(CFrame.new(-949, 59, -10907))
        end
    elseif SelectedIsland == "Haunted Castle" then
        if BypassTeleport then
            BTP(CFrame.new(-9530.61035, -132.860657, 5763.13477))
        else
            Tween(CFrame.new(-9530.61035, -132.860657, 5763.13477))
        end
    elseif SelectedIsland == "Cake Loaf" then
        if BypassTeleport then
            BTP(CFrame.new(-2099.33154, 66.9970703, -12128.585, 0.997561574, 0, 0.0697919354, 0, 1, 0, -0.0697919354, 0, 0.997561574))
        else
            Tween(CFrame.new(-2099.33154, 66.9970703, -12128.585, 0.997561574, 0, 0.0697919354, 0, 1, 0, -0.0697919354, 0, 0.997561574))
        end
    elseif SelectedIsland == "Candy Cane" then
        if BypassTeleport then
            BTP(CFrame.new(-1530.97144, 13.728817, -14770.0889, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359))
        else
            Tween(CFrame.new(-1530.97144, 13.728817, -14770.0889, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359))
        end
    elseif SelectedIsland == "Tiki Outpost" then
        if BypassTeleport then
            BTP(CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566))
        else
            Tween(CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566))
        end
    elseif SelectedIsland == "Raid Lab" then
        if BypassTeleport then
            BTP(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
        else
            Tween(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
        end
    elseif SelectedIsland == "Mini Sky" then
        if BypassTeleport then
            BTP(CFrame.new(-263.66668701172, 49325.49609375, -35260))
        else
            Tween(CFrame.new(-263.66668701172, 49325.49609375, -35260))
        end
    elseif SelectedIsland == "Sea Beast" then
        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Sea of Treats"].CFrame)
    end
end)

Island_Teleport:addToggle("Bypass Teleport", BypassTeleport, function(Value)
    BypassTeleport = Value
end)
----------------------------------------------------//----------------------------------------------------
--// TELEPORTSTATUS RIGHT
local TeleportStatus_Right = Tab.Tab_5:addSection()

local Status_Player = TeleportStatus_Right:addMenu('#Status Player')
local RaceStatus = Status_Player:addLabel("")
local PointStatus = Status_Player:addLabel("")
local StatusFunc1 = Status_Player:addLabel("")
local StatusFunc2 = Status_Player:addLabel("")
local StatusFunc3 = Status_Player:addLabel("")
local StatusFunc4 = Status_Player:addLabel("")
local StatusFunc5 = Status_Player:addLabel("")
spawn(function()
    while wait() do
        RaceStatus:Refresh("Race : "..tostring(game:GetService("Players").LocalPlayer.Data.Race.Value))
        PointStatus:Refresh("Points Avaible : "..tostring(game:GetService("Players").LocalPlayer.Data.Points.Value)..' Point')
        StatusFunc1:Refresh("Melee : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Melee:WaitForChild("Level").Value)..' Point Left')
        StatusFunc2:Refresh("Defense : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Defense:WaitForChild("Level").Value)..' Point')
        StatusFunc3:Refresh("Sword : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Sword:WaitForChild("Level").Value)..' Point')
        StatusFunc4:Refresh("Gun : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Gun:WaitForChild("Level").Value)..' Point')
        StatusFunc5:Refresh("Devil Fruit : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"]:WaitForChild("Level").Value)..' Point')
    end
end)
----------------------------------------------------//----------------------------------------------------
--// Set Status
local Set_Status = TeleportStatus_Right:addMenu('#Setting Status')
SelectPoint = 1
Set_Status:addTextbox("Set Point", SelectPoint, function(Value)
    SelectPoint = Value
end)

Set_Status:addToggle("Melee", Meleef, function(Value)
    Meleef = Value
    while wait() and Meleef do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", SelectPoint)
    end
end)

Set_Status:addToggle("Defense", Defensef, function(Value)
    Defensef = Value
    while wait() and Defensef do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", SelectPoint)
    end
end)

Set_Status:addToggle("Sword", Swordf, function(Value)
    Swordf = Value
    while wait() and Swordf do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", SelectPoint)
    end
end)

Set_Status:addToggle("Gun", Gunf, function(Value)
    Gunf = Value
    while wait() and Gunf do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", SelectPoint)
    end
end)

Set_Status:addToggle("Devil Fruit", DevilFruitf, function(Value)
    DevilFruitf = Value
    while wait() and DevilFruitf do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", SelectPoint)
    end
end)

----------------------------------------------------//----------------------------------------------------
--// SHOP LEFT
local Shop_Left = Tab.Tab_6:addSection()
local RaceFragShop = Shop_Left:addMenu('#Bone - Ecto - Fragment')
RaceFragShop:addButton("Race Ghoul [ $100 Ectoplasm ]", function()
    local args1 = {
        [1] = "Ectoplasm",
        [2] = "BuyCheck",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))
    local args2 = {
        [1] = "Ectoplasm",
        [2] = "Change",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
end)

RaceFragShop:addButton("Cyborg [ $??? ]", function()
    local args = {
        [1] = "CyborgTrainer",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

RaceFragShop:addButton("Suprise Bone [ ðŸ¦´50 Bone ]", function()
    local args = {
        [1] = "Bones",
        [2] = "Buy",
        [3] = 1,
        [4] = 1
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

RaceFragShop:addButton("Stat Refund [ ðŸ¦´50 Bone ]", function()
    local args = {
        [1] = "Bones",
        [2] = "Buy",
        [3] = 1,
        [4] = 2
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

RaceFragShop:addButton("Race Reroll [ ðŸ¦´50 Bone ]", function()
    local args = {
        [1] = "Bones",
        [2] = "Buy",
        [3] = 1,
        [4] = 3
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

RaceFragShop:addButton("Random Race [ f3000 Fragments ]", function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Reroll",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

RaceFragShop:addButton("Reset Stats [ f2500 Fragments ]", function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Refund",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

----------------------------------------------------//----------------------------------------------------
--// ABILITIES SHOP
local AbilityShop = Shop_Left:addMenu('#Abilities')
AbilityShop:addButton("Skyjump [ $10,000 Beli ]", function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

AbilityShop:addButton("Buso Haki [ $25,000 Beli ]", function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

AbilityShop:addButton("Soru [ $100,000 Beli ]", function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

AbilityShop:addButton("Observation haki [ $750,000 Beli ]", function()
    local args = {
        [1] = "KenTalk",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
----------------------------------------------------//----------------------------------------------------
--// FIGHTING SHOP
local FightingShop = Shop_Left:addMenu('#Fighting')
FightingShop:addButton("Black Leg [ $150,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
end)

FightingShop:addButton("Electro [ $550,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
end)

FightingShop:addButton("Fishman Karate [ $750,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
end)

FightingShop:addButton("Dragon Claw [ $1,500 Fragments ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
end)

FightingShop:addButton("Superhuman [ $3,000,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
end)

FightingShop:addButton("Death Step [ $5,000 Fragments / $5,000,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
end)

FightingShop:addButton("Sharkman Karate [ $5,000 Fragments / $2,500,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end)

FightingShop:addButton("Electric Claw [ $5,000 Fragments / $3,000,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
end)

FightingShop:addButton("Dragon Talon [ $5,000 Fragments / $3,000,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
end)

FightingShop:addButton("God Human [ $5,000 Fragments / $5,000,000 Beli ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
end)
----------------------------------------------------//----------------------------------------------------
--// SWORD SHOP
local SwordShop = Shop_Left:addMenu('#Sword')

SwordShop:addButton("Cutlass [ $1,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Cutlass"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Katana [ $1,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Dual Katana [ $12,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Dual Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Iron Mace [ $25,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Iron Mace"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Triple Katana [ $60,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Triple Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Pipe [ $100,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Pipe"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Dual-Headed Blade [ $400,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Dual-Headed Blade"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Soul Cane [ $750,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Soul Cane"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Bisento [ $1,200,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Bisento"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SwordShop:addButton("Pole v2 [ f5,000 Fragments ]", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
end)

----------------------------------------------------//----------------------------------------------------
--// SHOP RIGHT
local Shop_Right = Tab.Tab_6:addSection()
local DevilShop = Shop_Right:addMenu('#Devil Fruits')
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")

local ShopDevilSell = {}
for i,v in next,Remote_GetFruits do
    if v.OnSale then 
        table.insert(ShopDevilSell,v.Name)
    end
end

local PriceDevFruit = DevilShop:addLabel('Fruit Price : -')
spawn(function()
    while task.wait() do
        for i,v in next,Remote_GetFruits do
            if v.Name == Select_Devil_Fruit then
                PriceDevFruit:Refresh('Fruit Price : $' .. v.Price)
            end
        end
    end
end)

local DevilShopsRefresh = DevilShop:addDropdown('Select Devil Fruit on Sale', Select_Devil_Fruit, ShopDevilSell, function(Value)
    Select_Devil_Fruit = Value
end)

DevilShop:addButton("Refresh Fruit on Sale", function()
    DevilShopsRefresh:Clear()
    DevilShopsRefresh:Refresh(ShopDevilSell)
end)

DevilShop:addButton("Buy Devil Fruit on Sale", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",Select_Devil_Fruit)
end)

DevilShop:addToggle('Buy Random Fruit', AutoBuyFruitZioles, function(Value)
    AutoBuyFruitZioles = Value
end)
spawn(function()
    while task.wait() do
        if AutoBuyFruitZioles then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end)
        end
    end
end)

function getNil(name,class)
    for _,v in next, getnilinstances() do
        if v.ClassName == class and v.Name == name then
            return v
        end
    end
end

function StoredFruited(name_1, name_2)
    local Character = game:GetService("Players").LocalPlayer.Character
    local Backpack = game:GetService("Players").LocalPlayer.Backpack
    local CommF_ = game:GetService("ReplicatedStorage").Remotes.CommF_
    if Character:FindFirstChild(name_2) or Backpack:FindFirstChild(name_2) then
        local args = {
            [1] = "StoreFruit",
            [2] = name_1,
            [3] = Character:FindFirstChild(name_2) or Backpack:FindFirstChild(name_2) 
        }
        CommF_:InvokeServer(unpack(args))
    end
end

DevilShop:addToggle('Auto Stored Fruit (Working)', AutoStoreFruit, function(Value)
    AutoStoreFruit = Value
end)
spawn(function()
    while task.wait() do
        if AutoStoreFruit then
            pcall(function()
                StoredFruited("Rocket-Rocket", "Rocket Fruit")
                StoredFruited("Spin-Spin", "Spin Fruit")
                StoredFruited("Chop-Chop", "Chop Fruit")
                StoredFruited("Spring-Spring", "Spring Fruit")
                StoredFruited("Bomb-Bomb", "Bomb Fruit")
                StoredFruited("Smoke-Smoke", "Smoke Fruit")
                StoredFruited("Spike-Spike", "Spike Fruit")
                StoredFruited("Flame-Flame", "Flame Fruit")
                StoredFruited("Falcon-Falcon", "Falcon Fruit")
                StoredFruited("Ice-Ice", "Ice Fruit")
                StoredFruited("Sand-Sand", "Sand Fruit")
                StoredFruited("Dark-Dark", "Dark Fruit")
                StoredFruited("Diamond-Diamond", "Diamond Fruit")
                StoredFruited("Light-Light", "Light Fruit")
                StoredFruited("Rubber-Rubber", "Rubber Fruit")
                StoredFruited("Barrier-Barrier", "Barrier Fruit")
                StoredFruited("Ghost-Ghost", "Ghost Fruit")
                StoredFruited("Magma-Magma", "Magma Fruit")
                StoredFruited("Quake-Quake", "Quake Fruit")
                StoredFruited("Buddha-Buddha", "Buddha Fruit")
                StoredFruited("Love-Love", "Love Fruit")
                StoredFruited("Spider-Spider", "Spider Fruit")
                StoredFruited("Sound-Sound", "Sound Fruit")
                StoredFruited("Phoenix-Phoenix", "Phoenix Fruit")
                StoredFruited("Portal-Portal", "Portal Fruit")
                StoredFruited("Rumble-Rumble", "Rumble Fruit")
                StoredFruited("Pain-Pain", "Pain Fruit")
                StoredFruited("Blizzard-Blizzard", "Blizzard Fruit")
                StoredFruited("Gravity-Gravity", "Gravity Fruit")
                StoredFruited("Mammoth-Mammoth", "Mammoth Fruit")
                StoredFruited("Dough-Dough", "Dough Fruit")
                StoredFruited("Shadow-Shadow", "Shadow Fruit")
                StoredFruited("Venom-Venom", "Venom Fruit")
                StoredFruited("Control-Control", "Control Fruit")
                StoredFruited("Spirit-Spirit", "Spirit Fruit")
                StoredFruited("Dragon-Dragon", "Dragon Fruit")
                StoredFruited("Leopard-Leopard", "Leopard Fruit")
                StoredFruited("Kitsune-Kitsune", "Kitsune Fruit")
            end)
        end
    end
end)

DevilShop:addToggle("Fruit Notification", _G.FruitCheck, function(Value)
    _G.FruitCheck = Value
end)
spawn(function()
    while wait(.1) do
        if _G.FruitCheck then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") then
                    require(game:GetService("ReplicatedStorage").Notification).new(v.Name.." Spawned"):Display();
                    wait()
                    setthreadcontext(5)
                end
            end
        end
    end
end)

DevilShop:addToggle("Teleport to Fruit", _G.TeleportFruit, function(Value)
    _G.TeleportFruit = Value
    CancelTween(_G.TeleportFruit)
end)
spawn(function()
    while wait() do
        if _G.TeleportFruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") then
                    Tween(v.Handle.CFrame)
                end
            end
        end
    end
end)

DevilShop:addToggle("Bring Fruit (Instant)", _G.BringFruitBF, function(Value)
    _G.BringFruitBF = Value
end)
spawn(function()
    while wait() do
        if _G.BringFruitBF then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") then
                        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end	
            end)
        end
    end
end)

----------------------------------------------------//----------------------------------------------------
--// Gun Shop
local GunShop = Shop_Right:addMenu('#Gun')
GunShop:addButton("Slingshot [ $5,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Slingshot"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

GunShop:addButton("Musket [ $8,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Musket"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

GunShop:addButton("Flintlock [ $10,500 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Flintlock"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

GunShop:addButton("Refined Slingshot [ $30,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Refined Slingshot"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

GunShop:addButton("Refined Flintlock [ $65,000 Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Refined Flintlock"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

GunShop:addButton("Kabucha [ f1,500 Fragments)", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
end)

----------------------------------------------------//----------------------------------------------------
--// Accessoreies Shop
local AccessoriesShop = Shop_Right:addMenu('#Accessories')
AccessoriesShop:addButton("Black Cape [ $50,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Black Cape"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

AccessoriesShop:addButton("Swordsman Hat [ 150k Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Swordsman Hat"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

AccessoriesShop:addButton("Tomoe Ring [ $500k Beli ]", function()
    local args = {
        [1] = "BuyItem",
        [2] = "Tomoe Ring"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

----------------------------------------------------//----------------------------------------------------
--// MISC LEFT
local Misc_Left = Tab.Tab_7:addSection()

----------------------------------------------------//----------------------------------------------------
--// MISC RIGHT
local Misc_2 = Misc_Left:addMenu('#Misc')

Misc_2:addToggle('Dodge No CD', DodgewithoutCool, function(Value)
    DodgewithoutCool = Value
end)
function NoCooldown()
    for i,v in next, getgc() do
        if typeof(v) == "function" then
            if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Dodge") then
                for i2,v2 in next, getupvalues(v) do
                    if tostring(v2) == "0.4" then
                        setupvalue(v,i2,0)
                    end
                end
            end
        end
    end
end
spawn(function()
    while wait() do
        if DodgewithoutCool then
            pcall(function()
                NoCooldown()
            end)
        end
    end
end)

Misc_2:addToggle('Infinite Energy', InfiniteAbility, function(Value)
    InfiniteAbility = Value
end)
function InfinityEnergy()
    game:GetService('Players').LocalPlayer.Character.Energy.Changed:connect(function()
        if InfiniteAbility then
            game:GetService('Players').LocalPlayer.Character.Energy.Value = game:GetService('Players').LocalPlayer.Character.Energy.MaxValue
        end 
    end)
end
spawn(function()
    while wait() do
        if InfiniteAbility then
            pcall(function()
                InfinityEnergy()
            end)
        end
    end
end)

Misc_2:addToggle('Infinite Geppo', InfiniteGeppo, function(Value)
    InfiniteGeppo = Value
end)
spawn(function()
    while task.wait(1) do
        if InfiniteGeppo then
            pcall(function()
                for i,v in next, getgc() do
                    if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Geppo") then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0" then
                                repeat wait(.1)
                                    setupvalue(v,i2,0)
                                until not InfiniteGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

Misc_2:addToggle('Infinite Soru', InfiniteSoru, function(Value)
    InfiniteSoru = Value
end)
spawn(function()
    while task.wait(1) do
        if InfiniteSoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
            pcall(function()
                for i,v in next, getgc() do
                    if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") then
                        for i2,v2 in pairs(debug.getupvalues(v)) do
                            if type(v2) == 'table' then
                                if v2.LastUse then
                                    repeat task.wait(.1)
                                        setupvalue(v, i2, {LastAfter = 0,LastUse = 0})
                                    until not InfiniteSoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

WalkOnWater = true
Misc_2:addToggle('Walk on Water', WalkOnWater, function(Value)
    WalkOnWater = Value
end)
spawn(function()
    while task.wait(1) do
        if WalkOnWater then
            pcall(function()
                if not nelzkie then
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
                else
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
                end
            end)
        end
    end
end)

Misc_2:addToggle('Remove Fog', _G.Remove_Fog, function(Value)
    _G.Remove_Fog = Value

    if not _G.Remove_Fog then return end
    while _G.Remove_Fog do wait()
        game.Lighting.FogEnd = 9e9
        if not _G.Remove_Fog then
            game.Lighting.FogEnd = 2500
        end
    end
end)

Misc_2:addToggle('White Screen', _G.White_Screen, function(Value)
    _G.White_Screen = Value
    if _G.White_Screen then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    else
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)

----------------------------------------------------//----------------------------------------------------
local Misc_1 = Misc_Left:addMenu('#Misc')

local CodeList = {
    "EXP_5B",
    "CONTROL",
    "UPDATE11",
    "XMASEXP",
    "1BILLION",
    "ShutDownFix2",
    "UPD14",
    "STRAWHATMAINE",
    "TantaiGaming",
    "Colosseum",
    "Axiore",
    "Sub2Daigrock",
    "Sky Island 3",
    "Sub2OfficialNoobie",
    "SUB2NOOBMASTER123",
    "THEGREATACE",
    "Fountain City",
    "BIGNEWS",
    "FUDD10",
    "SUB2GAMERROBOT_EXP1",
    "UPD15",
    "2BILLION",
    "UPD16",
    "3BVISITS",
    "fudd10_v2",
    "Starcodeheo",
    "Magicbus",
    "JCWK",
    "Bluxxy",
    "Sub2Fer999",
    "Enyu_is_Pro",

    "SECRET_ADMIN",
    "KITT_RESET",
    "DRAGONABUSE",
    "Sub2CaptainMaui",
    "DEVSCOOKING",
    "kittgaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "fudd10_v2",
    "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "Fudd10",
    "Bignews",
    "TheGreatAce"
}
Misc_1:addButton('Redeem X2 Code', function()
    function RedeemCode(value)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    end
    for i,v in pairs(CodeList) do
        RedeemCode(v)
    end
end)

Misc_1:addButton("Join Pirates Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
end)
    
Misc_1:addButton("Join Marines Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
end)

Misc_1:addButton("Always Day", function()
    while game:GetService("RunService").Heartbeat:wait() do
        game:GetService("Lighting").ClockTime = 12
    end
end)

Misc_1:addButton("Remove Lave", function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "Lava" then   
            v:Destroy()
        end
    end
    for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
        if v.Name == "Lava" then   
            v:Destroy()
        end
    end
end)

Misc_1:addButton("Title Name", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles") 
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)

Misc_1:addButton("Color Haki", function()
    game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)

----------------------------------------------------//----------------------------------------------------
--// MISC RIGHT
local Misc_Right = Tab.Tab_7:addSection()
local ESP_Section = Misc_Right:addMenu('#ESP')
ESP_Section:addToggle('Chest ESP', ChestESP, function(Value)
    ChestESP = Value
end)
spawn(function()
    while wait() do
        pcall(function()
            if ChestESP then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                        if not v:FindFirstChild("ChestESP") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "ChestESP"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                            
                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude)
                        v.ChestESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
                        if v.Name == "Chest1" then
                            v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.fromRGB(109, 109, 109)
                        elseif v.Name == "Chest2" then
                            v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.fromRGB(173, 158, 21)
                        elseif v.Name == "Chest3" then
                            v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.fromRGB(85, 255, 255)
                        end
                    end
                end
            else
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                        if v:FindFirstChild("ChestESP") then
                            v.ChestESP:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

ESP_Section:addToggle('Devil Fruit ESP (Red Color)', _G.ESPDF, function(Value)
    _G.ESPDF = Value
end)
spawn(function()
    while wait() do
        if _G.ESPDF then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("Handle") then
                            repeat task.wait(.1)
                                if not v.Handle:FindFirstChild("DevilFruitESP") then
                                    local BillboardGui = Instance.new("BillboardGui")
                                    local TextLabel = Instance.new("TextLabel")

                                    BillboardGui.Parent = v.Handle
                                    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                    BillboardGui.Active = true
                                    BillboardGui.Name = "DevilFruitESP"
                                    BillboardGui.AlwaysOnTop = true
                                    BillboardGui.LightInfluence = 1.000
                                    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                    TextLabel.Parent = BillboardGui
                                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    TextLabel.BackgroundTransparency = 1.000
                                    TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                    TextLabel.Font = Enum.Font.GothamBold
                                    TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                    TextLabel.FontSize = "Size14"
                                    TextLabel.TextStrokeTransparency = 0.5
                                end
                                local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
                                v.Handle.DevilFruitESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
                            until not _G.ESPDF
                        end
                    end
                end
            end)
        else
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    if v:FindFirstChild("Handle") then
                        if v.Handle:FindFirstChild("DevilFruitESP") then
                            v.Handle.DevilFruitESP:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

ESP_Section:addToggle('Fruit ESP (Yellow Color)', FruitESPe, function(Value)
    FruitESPe = Value
end)
spawn(function()
    while wait() do
        if FruitESPe then
            pcall(function()
                for a,b in pairs(game.Workspace:GetChildren()) do
                    if b.Name == 'PineappleSpawner' or b.Name == 'BananaSpawner' or b.Name == 'AppleSpawner' then
                        for i,v in pairs(b:GetChildren()) do
                            if v:IsA('Tool') then
                                if v:FindFirstChild("Handle") then
                                    repeat task.wait(.1)
                                        if not v.Handle:FindFirstChild("FruitESP") then
                                            local BillboardGui = Instance.new("BillboardGui")
                                            local TextLabel = Instance.new("TextLabel")

                                            BillboardGui.Parent = v.Handle
                                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                            BillboardGui.Active = true
                                            BillboardGui.Name = "FruitESP"
                                            BillboardGui.AlwaysOnTop = true
                                            BillboardGui.LightInfluence = 1.000
                                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                            TextLabel.Parent = BillboardGui
                                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            TextLabel.BackgroundTransparency = 1.000
                                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                            TextLabel.Font = Enum.Font.GothamBold
                                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                                            TextLabel.FontSize = "Size14"
                                            TextLabel.TextStrokeTransparency = 0.5
                                        end
                                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
                                        v.Handle.FruitESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
                                    until not FruitESPe
                                end
                            end
                        end
                    end
                end
            end)
        else
            for a,b in pairs(game.Workspace:GetChildren()) do
                if b.Name == 'PineappleSpawner' or b.Name == 'BananaSpawner' or b.Name == 'AppleSpawner' then
                    for i,v in pairs(b:GetChildren()) do
                        if v:IsA('Tool') then
                            if v:FindFirstChild("Handle") then
                                if v.Handle:FindFirstChild("FruitESP") then
                                    v.Handle.FruitESP:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

ESP_Section:addToggle('Flower ESP', FlowerESP, function(Value)
    FlowerESP = Value
end)
spawn(function()
    while wait() do
        if FlowerESP then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Flower2" or v.Name == "Flower1" then
                        if not v:FindFirstChild("FindFlower") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "FindFlower"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(250, 250, 30)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude)
                        v.FindFlower.TextLabel.Text = v.Name.." - ["..Dis.." M]"
                        if v.Name == "Flower1" then
                            v.FindFlower.TextLabel.TextColor3 = Color3.new(255,120,120)
                        elseif v.Name == "Flower2" then
                            v.FindFlower.TextLabel.TextColor3 = Color3.new(120,120,255)
                        end
                    end
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("FindFlower") then
                    v.FindFlower:Destroy()
                end
            end
        end
    end
end)

ESP_Section:addToggle('Island ESP', IslandESP, function(Value)
    IslandESP = Value
end)
spawn(function()
    while wait() do
        if IslandESP then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if not v:FindFirstChild("IslandEsp") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "IslandEsp"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
                        TextLabel.FontSize = "Size14"
                        TextLabel.TextStrokeTransparency = 0.5
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10)
                    v.IslandEsp.TextLabel.Text = v.Name.."\n".."["..Dis.."]"
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                if v:FindFirstChild("IslandEsp") then
                    v.IslandEsp:Destroy()
                end
            end
        end
    end
end)

ESP_Section:addToggle('Npc ESP', NpcESP, function(Value)
    NpcESP = Value
end)
spawn(function()
    while wait() do
        if NpcESP then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("NpcEspes") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "NpcEspes"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
                            TextLabel.FontSize = "Size14"
                            TextLabel.TextStrokeTransparency = 0.5
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.NpcEspes.TextLabel.Text = v.Name.." - ["..Dis.." M]"
                    end
                end
            end)
        else
            for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild("NpcEspes") then
                    v.NpcEspes:Destroy()
                end
            end
        end
    end
end)

ESP_Section:addToggle('Legend Sword Dealer ESP', LADESP, function(Value)
    LADESP = Value
end)
function UpdateLSDESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP then 
                if v.Name == "Legendary Sword Dealer" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
spawn(function()
    while wait() do
        if LADESP then
            pcall(function()
                UpdateLSDESP()
            end)
        end
    end
end)
