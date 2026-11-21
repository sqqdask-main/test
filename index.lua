--[[
    Welcome UI Script for Delta Executor
    واجهة ترحيب تختفي تلقائياً
--]]

-- التحقق من اللاعب
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- إزالة أي واجهة قديمة
local oldGui = PlayerGui:FindFirstChild("WelcomeUI")
if oldGui then oldGui:Destroy() end

-- إنشاء الـ ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WelcomeUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- الإطار الرئيسي (يبدأ صغير الحجم)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 170, 255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- تدرج لوني خلفي
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 255)),
}
Gradient.Rotation = 45
Gradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(1, 0.85),
}
Gradient.Parent = MainFrame

-- أيقونة الترحيب (إيموجي بديل عبر TextLabel)
local IconLabel = Instance.new("TextLabel")
IconLabel.Name = "Icon"
IconLabel.Size = UDim2.new(0, 60, 0, 60)
IconLabel.Position = UDim2.new(0.5, 0, 0, 20)
IconLabel.AnchorPoint = Vector2.new(0.5, 0)
IconLabel.BackgroundTransparency = 1
IconLabel.Text = "👋"
IconLabel.TextSize = 48
IconLabel.Font = Enum.Font.GothamBold
IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
IconLabel.Parent = MainFrame

-- نص الترحيب
local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Name = "WelcomeLabel"
WelcomeLabel.Size = UDim2.new(1, -20, 0, 30)
WelcomeLabel.Position = UDim2.new(0.5, 0, 0, 85)
WelcomeLabel.AnchorPoint = Vector2.new(0.5, 0)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "أهلاً وسهلاً 👋"
WelcomeLabel.TextSize = 22
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.Parent = MainFrame

-- اسم اللاعب
local NameLabel = Instance.new("TextLabel")
NameLabel.Name = "NameLabel"
NameLabel.Size = UDim2.new(1, -20, 0, 25)
NameLabel.Position = UDim2.new(0.5, 0, 0, 118)
NameLabel.AnchorPoint = Vector2.new(0.5, 0)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = LocalPlayer.DisplayName
NameLabel.TextSize = 16
NameLabel.Font = Enum.Font.GothamMedium
NameLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
NameLabel.Parent = MainFrame

-- نص فرعي
local SubLabel = Instance.new("TextLabel")
SubLabel.Name = "SubLabel"
SubLabel.Size = UDim2.new(1, -20, 0, 20)
SubLabel.Position = UDim2.new(0.5, 0, 0, 145)
SubLabel.AnchorPoint = Vector2.new(0.5, 0)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "مرحباً بك في السكربت 🚀"
SubLabel.TextSize = 13
SubLabel.Font = Enum.Font.Gotham
SubLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SubLabel.Parent = MainFrame

-- شريط تحميل سفلي (اختياري)
local ProgressBar = Instance.new("Frame")
ProgressBar.Name = "ProgressBar"
ProgressBar.Size = UDim2.new(1, -40, 0, 4)
ProgressBar.Position = UDim2.new(0.5, 0, 1, -15)
ProgressBar.AnchorPoint = Vector2.new(0.5, 1)
ProgressBar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = MainFrame

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(1, 0)
ProgressCorner.Parent = ProgressBar

local ProgressFill = Instance.new("Frame")
ProgressFill.Name = "Fill"
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = ProgressFill

-- ============ حركات الظهور ============

-- ظهور الإطار
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 200)
}):Play()

-- حركة الأيقونة (اهتزاز ترحيبي)
task.wait(0.3)
for i = 1, 4 do
    TweenService:Create(IconLabel, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Rotation = 15
    }):Play()
    task.wait(0.15)
    TweenService:Create(IconLabel, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Rotation = -15
    }):Play()
    task.wait(0.15)
end
TweenService:Create(IconLabel, TweenInfo.new(0.1), {Rotation = 0}):Play()

-- تحريك شريط التقدم
TweenService:Create(ProgressFill, TweenInfo.new(2.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- ============ الاختفاء بعد 3 ثواني ============
task.delay(3, function()
    -- تصغير وشفافية
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(MainStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    TweenService:Create(IconLabel, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(WelcomeLabel, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(NameLabel, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(SubLabel, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(ProgressBar, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(ProgressFill, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    
    task.wait(0.6)
    ScreenGui:Destroy()
end)