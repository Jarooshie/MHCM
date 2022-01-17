if game.CoreGui:FindFirstChild("MHCM_") then
	game.CoreGui["MHCM_"]:Destroy()
end

local plr = game.Players.LocalPlayer

function dragify(Frame)
    local dragToggle = nil
    local dragSpeed = 0
    local dragInput = nil
    local dragStart = nil
    local dragPos = nil

    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    dragToggle = false
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if (input == dragInput and dragToggle) then
            updateInput(input)
        end
    end)
end



local MHCM_ = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Top = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Deco = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Container = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Credits = Instance.new("TextLabel")

dragify(Main)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.new(0,0,0)
stroke.Thickness = 1.5

MHCM_.Name = "MHCM_"
MHCM_.Parent = game.CoreGui
MHCM_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MHCM_
Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.167577416, 0, 0.412903219, 0)
Main.Size = UDim2.new(0, 393, 0, 252)

UICorner.Parent = Main

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Top.Size = UDim2.new(0, 393, 0, 29)

UICorner_2.Parent = Top

Deco.Name = "Deco"
Deco.Parent = Top
Deco.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Deco.BorderSizePixel = 0
Deco.Position = UDim2.new(0, 0, 0.724137902, 0)
Deco.Size = UDim2.new(0, 393, 0, 8)

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.GothamBlack
Title.Text = "Miner's Haven Client Monitor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
stroke:Clone().Parent = Title

Close.Name = "Close"
Close.Parent = Top
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(1, -29, 0, 0)
Close.Size = UDim2.new(0, 29, 0, 29)
Close.Font = Enum.Font.GothamBlack
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 94, 94)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function()
    MHCM_:Destroy()
end)
stroke:Clone().Parent = Close

Container.Name = "Container"
Container.Parent = Main
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 1.000
Container.Position = UDim2.new(0, 0, 0.127192989, 0)
Container.Size = UDim2.new(1, 0, 0.828947365, 0)

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.Position = UDim2.new(0.0254452918, 0, 0.962285731, 0)
Credits.Size = UDim2.new(0, 372, 0, 9)
Credits.Font = Enum.Font.Code
Credits.Text = "Made By: Jarooshie#5081"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextTransparency = 0.700
Credits.TextWrapped = true
Credits.TextXAlignment = Enum.TextXAlignment.Left
stroke:Clone().Parent = Credits

UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = Container
UIPadding.PaddingTop = UDim.new(0, 5)

function createTemp(icon,clr,currency,current)
    local Template = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local Icon = Instance.new("ImageLabel")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local Current = Instance.new("TextLabel")
    local Changed = Instance.new("TextLabel")
    local Earned = Instance.new("TextLabel")
    
    local counter = 0
    
	Template.Name = "Template"
	Template.Parent = Container
	Template.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	Template.BorderSizePixel = 0
	Template.Size = UDim2.new(0, 373, 0, 25)
	Template.Visible = true

	UICorner_3.Parent = Template

	Icon.Name = "Icon"
	Icon.Parent = Template
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Size = UDim2.new(0, 25, 0, 25)
	Icon.Image = icon

	UIListLayout_2.Parent = Template
	UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	Current.Name = "Current"
	Current.Parent = Template
	Current.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Current.BackgroundTransparency = 1.000
	Current.Position = UDim2.new(0.0670241266, 0, 0, 0)
	Current.Size = UDim2.new(0, 121, 0, 25)
	Current.Font = Enum.Font.GothamBlack
	Current.Text = tostring(current.Value)..currency
	Current.TextColor3 = clr
	Current.TextSize = 14.000
	Current.TextWrapped = true
	Current.TextXAlignment = Enum.TextXAlignment.Right
	stroke:Clone().Parent = Current

	Changed.Name = "Changed"
	Changed.Parent = Template
	Changed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Changed.BackgroundTransparency = 1.000
	Changed.Position = UDim2.new(0.0670241266, 0, 0, 0)
	Changed.Size = UDim2.new(0, 121, 0, 25)
	Changed.Font = Enum.Font.GothamBlack
	Changed.Text = "+0"
	Changed.TextColor3 = clr
	Changed.TextSize = 14.000
	Changed.TextWrapped = true
	Changed.TextXAlignment = Enum.TextXAlignment.Right
	stroke:Clone().Parent = Changed

	Earned.Name = "Earned"
	Earned.Parent = Template
	Earned.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Earned.BackgroundTransparency = 1.000
	Earned.Position = UDim2.new(0.0670241266, 0, 0, 0)
	Earned.Size = UDim2.new(0, 100, 0, 25)
	Earned.Font = Enum.Font.GothamBlack
	Earned.Text = "Σ 0"
	Earned.TextColor3 = clr
	Earned.TextSize = 14.000
	Earned.TextWrapped = true
	Earned.TextXAlignment = Enum.TextXAlignment.Right
	stroke:Clone().Parent = Earned
	local old = current.Value
	
	current.Changed:Connect(function()
	    val = current.Value
	    Current.Text = tostring(val)..currency
	    if val < old then
	        Changed.Text = "-"..tostring(math.abs(val-old))
	    elseif val > old then
	       Changed.Text = "+"..tostring(math.abs(val-old))
	    end
	    if val > old then
	        counter = counter + (val-old)
	    end
	    Earned.Text = "Σ "..tostring(counter)
	    old = val
	end)
end
createTemp("rbxassetid://5506274466",Color3.fromRGB(221, 73, 179)," uC",plr.Crystals)
createTemp("rbxassetid://5140907803",Color3.fromRGB(143, 87, 14),"",plr.Crates.Regular)
createTemp("rbxassetid://5140908051",Color3.fromRGB(194, 48, 215),"",plr.Crates.Unreal)
createTemp("rbxassetid://5506273657",Color3.fromRGB(107, 228, 55),"",plr.Clovers)
createTemp("rbxassetid://5506279396",Color3.fromRGB(105,247,243)," RP",plr.Points)
