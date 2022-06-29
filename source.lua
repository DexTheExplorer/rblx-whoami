-- TWEEN

local function tween(obj,info,goal)
	game:GetService('TweenService'):Create(obj, info, goal):Play()
end

-- DEFINITION

local Players = game:GetService('Players')

local displayname = Players.LocalPlayer.DisplayName
local userid = Players.LocalPlayer.UserId

local bypasscheck = _G.WHOAMI_BYPASS_USER_CHECK
local whitelisted = _G.WHOAMI_WHITELISTED
local blacklisted = _G.WHOAMI_BLACKLISTED

-- DISCONNECT

local function exitGame()
	Players.LocalPlayer:Kick('\n======= KICK =======\n\nYou have been disconnected.\n\n======= KICK =======')
end

-- CHECK

local stop=false
if (bypasscheck ~= true) then
	for i, v in pairs(whitelisted) do

		if (tostring(userid) == tostring(v)) then

			stop = true

		else

			for j,k in pairs(blacklisted) do

				if (tostring(userid) == tostring(k)) then

					stop = true
					exitGame()

				end

			end
		end
	end
end

-- SETUP
if (stop ~= true) then
	local DARK = Color3.fromRGB(14,14,14)
	local ACCENT = Color3.fromRGB(255,105,180)

	PARENT=nil --gui root
	SOUND1=nil --start
	SOUND2=nil --hover
	SOUND3=nil --press
	SOUND4=nil --fade
	SOUND5=nil --close
	ENABLE_INSECURE_FEATURES=_G.WHOAMI_INSECURE_ENABLED
	--[[Insecure features are: blur effect, darkening effect]]--

	function randomString()
		local length = math.random(10,20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	end

	if (syn) then -- is cheat
		local Main=Instance.new('ScreenGui')
		Main.Name=randomString()
		Main.IgnoreGuiInset=true
		syn.protect_gui(Main)
		Main.Parent=game:GetService('CoreGui')
		PARENT=Main

		SOUND1=Instance.new('Sound')
		SOUND1.Name=randomString()
		SOUND1.SoundId=getsynasset('startup.ogg')
		SOUND1.Volume=3
		SOUND1.Parent = Main

		SOUND2=Instance.new('Sound')
		SOUND2.Name=randomString()
		SOUND2.SoundId=getsynasset('hover.ogg')
		SOUND2.Parent = Main

		SOUND3=Instance.new('Sound')
		SOUND3.Name=randomString()
		SOUND3.SoundId=getsynasset('pressed.ogg')
		SOUND3.Volume = 3
		SOUND3.Parent = Main

		SOUND4=Instance.new('Sound')
		SOUND4.Name=randomString()
		SOUND4.SoundId=getsynasset('close.ogg')
		SOUND4.Volume = 3
		SOUND4.Parent = Main

		SOUND5=Instance.new('Sound')
		SOUND5.Name=randomString()
		SOUND5.SoundId=getsynasset('exit.ogg')
		SOUND5.Volume = 3
		SOUND5.Parent = Main

	else -- is other cheat

		local Main=Instance.new('ScreenGui')
		Main.Name=randomString()
		Main.IgnoreGuiInset=true
		Main.Parent=game:GetService('CoreGui')
		PARENT=Main

		SOUND1=Instance.new('Sound')
		SOUND1.SoundId='rbxassetid://2668781453'
		SOUND1.Volume = 3
		SOUND1.Parent=script

		SOUND2=Instance.new('Sound')
		SOUND2.SoundId='rbxassetid://2668781453'
		SOUND2.Parent=script

		SOUND3=Instance.new('Sound')
		SOUND3.SoundId='rbxassetid://2668781453'
		SOUND3.Parent=script

		SOUND4=Instance.new('Sound')
		SOUND4.SoundId='rbxassetid://2668781453'
		SOUND4.Volume = 3
		SOUND4.Parent=script

		SOUND5=Instance.new('Sound')
		SOUND5.SoundId='rbxassetid://2668781453'
		SOUND5.Volume = 3
		SOUND5.Parent=script

	end

	local blur
	local ccor
	if (ENABLE_INSECURE_FEATURES) == true then

		blur = Instance.new('BlurEffect')
		blur.Name = randomString()
		blur.Size = 0
		blur.Parent = game:GetService('Lighting')

		ccor = Instance.new('ColorCorrectionEffect')
		ccor.Name = randomString()
		ccor.Parent = game:GetService('Lighting')

	end

	local fullframe = Instance.new('Frame')
	fullframe.Size = UDim2.new(1,0,1,0)
	fullframe.BackgroundColor3 = DARK
	fullframe.BackgroundTransparency = 1
	fullframe.Parent = PARENT

	local usericon = Instance.new('ImageLabel')
	usericon.Name = 'nofade'
	usericon.Size = UDim2.new(0,0,0,0)
	usericon.AnchorPoint = Vector2.new(0.5,0.5)
	usericon.Position = UDim2.new(0.5,0,0.5,0)
	usericon.BackgroundColor3 = DARK
	usericon.ZIndex = 2
	usericon.Image = Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	usericon.Parent = fullframe

	local radius = Instance.new('UICorner')
	radius.CornerRadius = UDim.new(0.5,0)
	radius.Parent = usericon

	local border = usericon:Clone()
	border.Name = 'nofade'
	border.BackgroundTransparency = 0.999
	border.ImageTransparency = 1
	border.Size = UDim2.new(0,240,0,240)
	border.ZIndex = 1
	border.Visible = false
	border.Parent = fullframe

	local ring = Instance.new('UIStroke')
	ring.Name = 'nofade'
	ring.Thickness = 5
	ring.Color = ACCENT
	ring.Parent = border

	local infoframe = Instance.new('Frame')
	infoframe.Size = UDim2.new(0,500,0,100)
	infoframe.AnchorPoint = Vector2.new(0.5,0.5)
	infoframe.Position = UDim2.new(0.5,0,0.5,100)
	infoframe.BackgroundTransparency = 1
	infoframe.Visible = false
	infoframe.Parent = fullframe

	local uname = Instance.new('TextLabel')
	uname.Size = UDim2.new(0,0,0.5,0)
	uname.AutomaticSize = Enum.AutomaticSize.X
	uname.AnchorPoint = Vector2.new(0.5,0)
	uname.Position = UDim2.new(0.5,0,0,0)
	uname.BackgroundTransparency = 1
	uname.RichText = true
	uname.Text = 'Greetings, <b>' .. displayname .. '</b>'
	uname.Font = Enum.Font.Ubuntu
	uname.TextScaled = true
	uname.TextColor3 = Color3.new(255,255,255)
	uname.Parent = infoframe

	local NSK = {NumberSequenceKeypoint.new(0,0);NumberSequenceKeypoint.new(1,1)}
	local sgrd = Instance.new('UIGradient')
	sgrd.Name = 'nofade'
	sgrd.Transparency = NumberSequence.new(NSK)
	sgrd.Offset = Vector2.new(-1,0)
	sgrd.Parent = uname

	local uconf = uname:Clone()
	uconf.Size = UDim2.new(1,0,0.5,0)
	uconf.Position = UDim2.new(0.5,0,0.5,0)
	uconf.Text = 'Do you want to proceed?'
	uconf.Parent = infoframe

	-- Beginning here, all instances were serialized using Instance Serializer.
	-- Wed 29, 2022 16:15:22

	local btnhost = Instance.new("Frame")
	btnhost.Name = "btnhost"
	btnhost.Size = UDim2.new(1, 0, 0, 50)
	btnhost.BackgroundTransparency = 1
	btnhost.Position = UDim2.new(0, 0, 1, 50)
	btnhost.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	btnhost.Visible = false

	local uill = Instance.new("UIListLayout")
	uill.FillDirection = Enum.FillDirection.Horizontal
	uill.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uill.VerticalAlignment = Enum.VerticalAlignment.Bottom
	uill.SortOrder = Enum.SortOrder.LayoutOrder
	uill.Padding = UDim.new(0, 20)
	uill.Parent = btnhost

	local exitBtn = Instance.new("TextButton")
	exitBtn.Size = UDim2.new(0, 200, 0, 50)
	exitBtn.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
	exitBtn.Modal = true
	exitBtn.TextSize = 25
	exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	exitBtn.Text = "Exit"
	exitBtn.TextWrapped = true
	exitBtn.Font = Enum.Font.Ubuntu
	exitBtn.TextWrap = true
	exitBtn.Parent = btnhost

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = exitBtn

	local border1 = Instance.new("UIStroke")
	border1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	border1.Thickness = 2
	border1.Color = Color3.fromRGB(255, 255, 255)
	border1.Parent = exitBtn

	local enterBtn = Instance.new("TextButton")
	enterBtn.Size = UDim2.new(0, 200, 0, 50)
	enterBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	enterBtn.Modal = true
	enterBtn.TextSize = 25
	enterBtn.TextColor3 = Color3.fromRGB(14, 14, 14)
	enterBtn.Text = "Enter"
	enterBtn.TextWrapped = true
	enterBtn.Font = Enum.Font.Ubuntu
	enterBtn.TextWrap = true
	enterBtn.Parent = btnhost

	local UICorner1 = Instance.new("UICorner")
	UICorner1.Parent = enterBtn

	local border2 = Instance.new("UIStroke")
	border2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	border2.Thickness = 2
	border2.Color = Color3.fromRGB(14, 14, 14)
	border2.Parent = enterBtn

	btnhost.Parent = infoframe

	-- ANIMATION

	if ENABLE_INSECURE_FEATURES then
		tween(ccor, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TintColor = DARK})
		tween(blur, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 24})
	else
		tween(fullframe, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5})
	end
	wait(0.75)
	SOUND1:Play()
	tween(usericon, TweenInfo.new(0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)})
	wait(0.01)
	tween(usericon, TweenInfo.new(0.115, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,250,0,250)})
	wait(0.155)
	tween(usericon, TweenInfo.new(0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)})
	wait(0.015)
	tween(usericon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,250,0,250)})
	wait(0.2) -- 0.65
	border.Size = UDim2.new(0,230,0,230)
	border.Visible = true
	tween(usericon, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5,0,0.5,-100)})
	tween(border, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5,0,0.5,-100)})
	wait(1.2)
	tween(border, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,270,0,270)})
	wait(0.4)
	infoframe.Visible = true
	tween(uconf.nofade, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Offset = Vector2.new(1,0)}) --hacky
	tween(sgrd, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Offset = Vector2.new(1,0)})
	wait(0.4)
	btnhost.Visible = true

	-- MISC HOOKS/FUNCTIONS

	local function fadeOut(object) -- why, roblox.
		for i,v in pairs(object:GetDescendants()) do
			local function hasProp(v, prop)
				local success = pcall(function()
					local t = v[prop]
				end)
				if success == true and v.Name ~= 'nofade' then
					return true
				else
					return false
				end
			end
			if hasProp(v, 'Transparency') then
				tween(v, TweenInfo.new(1), {Transparency = 1})
			end
			if hasProp(v, 'BackgroundTransparency') then
				tween(v, TweenInfo.new(1), {BackgroundTransparency = 1})
			end
			if hasProp(v, 'TextTransparency') then
				tween(v, TweenInfo.new(1), {Transparency = 1})
			end
			if hasProp(v, 'Transparency') then
				tween(v, TweenInfo.new(1), {Transparency = 1})
			end
		end
	end

	local function exitAnimation()
		fadeOut(fullframe)
		wait(0.15)
		tween(usericon, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5,0,0.5,0)})
		tween(border, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5,0,0.5,0)})
		wait(0.5)
		SOUND5:Play()
		tween(usericon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0,300,0,300)})
		tween(border, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0,320,0,320)})
		wait(0.3)
		tween(usericon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0,0,0,0)})
		tween(border, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0,0,0,0)})
		if ENABLE_INSECURE_FEATURES then
			tween(ccor, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TintColor = Color3.new(1,1,1)})
			tween(blur, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})
			wait(0.4)
			PARENT:Destroy()
			ccor:Destroy()
			blur:Destroy()
		else
			tween(fullframe, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
			wait(0.4)
			PARENT:Destroy()
		end

		wait(0.5)
		SOUND1:Destroy()
		SOUND2:Destroy()
		SOUND3:Destroy()
		SOUND4:Destroy()
		SOUND5:Destroy()
	end

	db=false
	enterBtn.MouseEnter:Connect(function()
		if (db == false) then
			SOUND2:Play()	
		end
	end)

	exitBtn.MouseEnter:Connect(function()
		if (db == false) then
			SOUND2:Play()	
		end
	end)

	enterBtn.MouseButton1Down:Connect(function()
		if (db == false) then
			db = true
			SOUND4:Play()
			exitAnimation()
		end
	end)

	exitBtn.MouseButton1Down:Connect(function()
		if (db == false) then
			db = true
			SOUND4:Play()
			wait(0.2)
			exitGame()
		end
	end)

end
