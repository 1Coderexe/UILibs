-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")

-- Vars
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}
GUI = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Init(options)
		Library:validate({
				
		}, options or {})	
	
	local GUI = {}
	
	-- Main Frame
	do
		-- StarterGui.CynLib
		GUI["1"] = Instance.new("ScreenGui", runService:isStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui());
		GUI["1"]["Name"] = [[CynLib]];
		GUI["1"]["IgnoreGuiInset"] = true

		-- StarterGui.CynLib.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 500, 0, 300);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.CynLib.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		
		-- StarterGui.CynLib.Main.DropShadowHolder
		GUI["1f"] = Instance.new("Frame", GUI["2"]);
		GUI["1f"]["ZIndex"] = 0;
		GUI["1f"]["BorderSizePixel"] = 0;
		GUI["1f"]["BackgroundTransparency"] = 1;
		GUI["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["1f"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.CynLib.Main.DropShadowHolder.DropShadow
		GUI["20"] = Instance.new("ImageLabel", GUI["1f"]);
		GUI["20"]["ZIndex"] = 0;
		GUI["20"]["BorderSizePixel"] = 0;
		GUI["20"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["20"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["20"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["20"]["ImageTransparency"] = 0.5;
		GUI["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["20"]["Image"] = [[rbxassetid://6015897843]];
		GUI["20"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["20"]["Name"] = [[DropShadow]];
		GUI["20"]["BackgroundTransparency"] = 1;
		GUI["20"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	end
	
	-- TopBar
	do
		-- StarterGui.CynLib.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(40, 41, 41);
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 65);
		GUI["4"]["Name"] = [[TopBar]];

		-- StarterGui.CynLib.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);

		-- StarterGui.CynLib.Main.TopBar.HeadDisplay
		GUI["6"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["6"]["BackgroundTransparency"] = 1;
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 0.5);
		GUI["6"]["Image"] = players:GetUserThumbnailAsync(players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
		GUI["6"]["Size"] = UDim2.new(0, 50, 0, 50);
		GUI["6"]["Name"] = [[HeadDisplay]];
		GUI["6"]["Position"] = UDim2.new(0, 7, 0, 32);

		-- StarterGui.CynLib.Main.TopBar.HeadDisplay.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 32);

		-- StarterGui.CynLib.Main.TopBar.DIsplayNameLabel
		GUI["8"] = Instance.new("TextLabel", GUI["4"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["8"]["TextSize"] = 19;
		GUI["8"]["TextColor3"] = Color3.fromRGB(198, 198, 198);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 0.5);
		GUI["8"]["Size"] = UDim2.new(0, 125, 0, 20);
		GUI["8"]["Text"] = [[Hi, ]]..players.LocalPlayer.DisplayName;
		GUI["8"]["Name"] = [[DIsplayNameLabel]];
		GUI["8"]["BackgroundTransparency"] = 1;
		GUI["8"]["Position"] = UDim2.new(0, 65, 0.5, -7);

		-- StarterGui.CynLib.Main.TopBar.UsernameLabel
		GUI["9"] = Instance.new("TextLabel", GUI["4"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["9"]["TextSize"] = 16;
		GUI["9"]["TextColor3"] = Color3.fromRGB(116, 116, 116);
		GUI["9"]["AnchorPoint"] = Vector2.new(0, 0.5);
		GUI["9"]["Size"] = UDim2.new(0, 125, 0, 20);
		GUI["9"]["Text"] = [[@]]..players.LocalPlayer.Name;
		GUI["9"]["Name"] = [[UsernameLabel]];
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Position"] = UDim2.new(0, 65, 0.5, 9);

		-- StarterGui.CynLib.Main.TopBar.GameName
		GUI["a"] = Instance.new("TextLabel", GUI["4"]);
		GUI["a"]["TextWrapped"] = true;
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["a"]["TextSize"] = 22;
		GUI["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["a"]["Size"] = UDim2.new(0, 175, 0, 50);
		GUI["a"]["Text"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;
		GUI["a"]["Name"] = [[GameName]];
		GUI["a"]["BackgroundTransparency"] = 1;
		GUI["a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.CynLib.Main.TopBar.Extension
		GUI["b"] = Instance.new("Frame", GUI["4"]);
		GUI["b"]["ZIndex"] = 2;
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(40, 41, 41);
		GUI["b"]["Size"] = UDim2.new(1, 0, 0, -5);
		GUI["b"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["b"]["Name"] = [[Extension]];

		-- StarterGui.CynLib.Main.TopBar.CloseLabel
		GUI["c"] = Instance.new("TextLabel", GUI["4"]);
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["c"]["TextSize"] = 22;
		GUI["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["c"]["Size"] = UDim2.new(0, 32, 0, 32);
		GUI["c"]["Name"] = "CloseLabel"
		GUI["c"]["Text"] = [[X]];
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(1, -24, 0.5, 0);
		
		local infoVars = {
			Hover = false,
			Active = false
		}
		
		GUI["c"].MouseEnter:Connect(function()
			infoVars.Hover = true
		end)
		
		GUI["c"].MouseLeave:Connect(function()
			infoVars.Hover = false
		end)
		
		GUI["c"].InputBegan:Connect(function(input, gpe)
			if gpe then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			
			infoVars.Active = true
		end)
		
		local function hasTransparencyProperty(object)
			return pcall(function()
				return object.Transparency
			end)
		end
		
		local function hasImageTransparency(object)
			return pcall(function()
				return object.ImageTransparency
			end)
		end
		
		GUI["c"].InputEnded:Connect(function(input, gpe)
			if gpe then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			
			if infoVars.Hover then
				for _, descendant in ipairs(GUI["1"]:GetDescendants()) do
					if hasTransparencyProperty(descendant) then
						Library:tween(descendant, {Transparency = 1})
					end
				end
				wait(0.095)
				GUI["1"]:Destroy()
			end
		end)
			infoVars.Active = false
end
	
	-- Content
	do
		-- StarterGui.CynLib.Main.Content
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["d"]["BackgroundTransparency"] = 1;
		GUI["d"]["Size"] = UDim2.new(1, 0, 0, 234);
		GUI["d"]["Position"] = UDim2.new(0.5, 0, 0.5, 33);
		GUI["d"]["Name"] = [[Content]];

		-- StarterGui.CynLib.Main.Content.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);

		-- StarterGui.CynLib.Main.Content.UtilScripts
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["ZIndex"] = 2;
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["BackgroundTransparency"] = 1;
		GUI["f"]["Size"] = UDim2.new(0.4000000059604645, 0, 1, 0);
		GUI["f"]["Position"] = UDim2.new(0, 40, 0, 0);
		GUI["f"]["Name"] = [[UtilScripts]];

		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionScripts
		GUI["10"] = Instance.new("Frame", GUI["f"]);
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["10"]["AnchorPoint"] = Vector2.new(0.5, 0);
		GUI["10"]["BackgroundTransparency"] = 1;
		GUI["10"]["Size"] = UDim2.new(1, -40, 1, -55);
		GUI["10"]["Position"] = UDim2.new(0.5, 0, 0, 45);
		GUI["10"]["Name"] = [[SectionScripts]];

		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionScripts.UIListLayout
		GUI["11"] = Instance.new("UIListLayout", GUI["10"]);
		GUI["11"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		GUI["11"]["Padding"] = UDim.new(0, 5);
		GUI["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionTitle
		GUI["14"] = Instance.new("TextLabel", GUI["f"]);
		GUI["14"]["ZIndex"] = 2;
		GUI["14"]["BackgroundColor3"] = Color3.fromRGB(53, 58, 69);
		GUI["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["14"]["TextSize"] = 14;
		GUI["14"]["TextColor3"] = Color3.fromRGB(223, 223, 223);
		GUI["14"]["AnchorPoint"] = Vector2.new(0.5, 0);
		GUI["14"]["Size"] = UDim2.new(0, 125, 0, 25);
		GUI["14"]["BorderColor3"] = Color3.fromRGB(43, 67, 84);
		GUI["14"]["Text"] = [[Util Scripts]];
		GUI["14"]["Name"] = [[SectionTitle]];
		GUI["14"]["BackgroundTransparency"] = 0.20000000298023224;
		GUI["14"]["Position"] = UDim2.new(0.5, 0, 0, 10);

		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionTitle.UICorner
		GUI["15"] = Instance.new("UICorner", GUI["14"]);
		GUI["15"]["CornerRadius"] = UDim.new(0, 14);

		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionTitle.UIStroke
		GUI["16"] = Instance.new("UIStroke", GUI["14"]);
		GUI["16"]["Color"] = Color3.fromRGB(0, 86, 128);
		GUI["16"]["Transparency"] = 0.20000000298023224;
		GUI["16"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui.CynLib.Main.Content.GameScripts
		GUI["17"] = Instance.new("Frame", GUI["d"]);
		GUI["17"]["ZIndex"] = 2;
		GUI["17"]["BorderSizePixel"] = 0;
		GUI["17"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["17"]["BackgroundTransparency"] = 1;
		GUI["17"]["Size"] = UDim2.new(0.4000000059604645, 0, 1, 0);
		GUI["17"]["Position"] = UDim2.new(0.5, 10, 0, 0);
		GUI["17"]["Name"] = [[GameScripts]];

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionScripts
		GUI["18"] = Instance.new("Frame", GUI["17"]);
		GUI["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["18"]["AnchorPoint"] = Vector2.new(0.5, 0);
		GUI["18"]["BackgroundTransparency"] = 1;
		GUI["18"]["Size"] = UDim2.new(1, -40, 1, -55);
		GUI["18"]["Position"] = UDim2.new(0.5, 0, 0, 45);
		GUI["18"]["Name"] = [[SectionScripts]];

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionScripts.UIListLayout
		GUI["19"] = Instance.new("UIListLayout", GUI["18"]);
		GUI["19"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		GUI["19"]["Padding"] = UDim.new(0, 5);
		GUI["19"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionTitle
		GUI["1c"] = Instance.new("TextLabel", GUI["17"]);
		GUI["1c"]["ZIndex"] = 2;
		GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(53, 58, 69);
		GUI["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["1c"]["TextSize"] = 14;
		GUI["1c"]["TextColor3"] = Color3.fromRGB(223, 223, 223);
		GUI["1c"]["AnchorPoint"] = Vector2.new(0.5, 0);
		GUI["1c"]["Size"] = UDim2.new(0, 125, 0, 25);
		GUI["1c"]["BorderColor3"] = Color3.fromRGB(43, 67, 84);
		GUI["1c"]["Text"] = [[Game Scripts]];
		GUI["1c"]["Name"] = [[SectionTitle]];
		GUI["1c"]["BackgroundTransparency"] = 0.20000000298023224;
		GUI["1c"]["Position"] = UDim2.new(0.5, 0, 0, 10);

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionTitle.UICorner
		GUI["1d"] = Instance.new("UICorner", GUI["1c"]);
		GUI["1d"]["CornerRadius"] = UDim.new(0, 14);

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionTitle.UIStroke
		GUI["1e"] = Instance.new("UIStroke", GUI["1c"]);
		GUI["1e"]["Color"] = Color3.fromRGB(0, 86, 128);
		GUI["1e"]["Transparency"] = 0.20000000298023224;
		GUI["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	end
	
	function GUI:AddUtilScript(options) 
		local options = Library:validate({
			scriptString = nil,
			scriptName = ""
		}, options or {})
		
		local RunnableScript = {
			Hover = false,
			Active = false
		}
		
		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionScripts.RunnableScript
		RunnableScript["12"] = Instance.new("TextLabel", GUI["10"]);
		RunnableScript["12"]["BorderSizePixel"] = 0;
		RunnableScript["12"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
		RunnableScript["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		RunnableScript["12"]["TextSize"] = 14;
		RunnableScript["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		RunnableScript["12"]["Size"] = UDim2.new(1, -25, 0, 25);
		RunnableScript["12"]["Text"] = options.scriptName;
		RunnableScript["12"]["Name"] = [[RunnableScript]];

		-- StarterGui.CynLib.Main.Content.UtilScripts.SectionScripts.RunnableScript.UICorner
		RunnableScript["13"] = Instance.new("UICorner", RunnableScript["12"]);

		RunnableScript["12"].MouseEnter:Connect(function()
			RunnableScript.Hover = true
			
			Library:tween(RunnableScript["12"], {BackgroundColor3 = Color3.fromRGB(38, 38, 38)})
			
		end)
		RunnableScript["12"].MouseLeave:Connect(function()
			RunnableScript.Hover = false
			
			Library:tween(RunnableScript["12"], {BackgroundColor3 = Color3.fromRGB(32, 32, 32)})
			
			if not RunnableScript.Active then
				Library:tween(RunnableScript["12"], {Transparency = 0})
			end
		end)
		
		uis.InputBegan:Connect(function(input, gpe)
			if gpe then return end
			
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				RunnableScript.Active = true
				
				if RunnableScript.Hover then
					Library:tween(RunnableScript["12"], {Transparency = 0.3})
					loadstring(options.scriptString)
				end
			end
		end)
		
		uis.InputEnded:Connect(function(input, gpe)
			if gpe then return end
			
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				RunnableScript.Active = false
				if RunnableScript.Hover then
					Library:tween(RunnableScript["12"], {Transparency = 0})
				end
			end
		end)
		
		return RunnableScript
	end
	
	function GUI:AddGameScript(options) 
		local options = Library:validate({
			scriptString = nil,
			scriptName = "",
			placeId = nil
		}, options or {})
		
		local RunnableScript = {
			Hover = false,
			Active = false
		}
		
		if options.placeId ~= game.PlaceId then return end 
		
		-- StarterGui.CynLib.Main.Content.GameScripts.SectionScripts.RunnableScript
		RunnableScript["1a"] = Instance.new("TextLabel", GUI["18"]);
		RunnableScript["1a"]["BorderSizePixel"] = 0;
		RunnableScript["1a"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
		RunnableScript["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		RunnableScript["1a"]["TextSize"] = 14;
		RunnableScript["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		RunnableScript["1a"]["Size"] = UDim2.new(1, -25, 0, 25);
		RunnableScript["1a"]["Text"] = options.scriptName;
		RunnableScript["1a"]["Name"] = [[RunnableScript]];

		-- StarterGui.CynLib.Main.Content.GameScripts.SectionScripts.RunnableScript.UICorner
		RunnableScript["1b"] = Instance.new("UICorner", RunnableScript["1a"]);

		RunnableScript["1a"].MouseEnter:Connect(function()
			RunnableScript.Hover = true
			
			Library:tween(RunnableScript["1a"], {BackgroundColor3 = Color3.fromRGB(38, 38, 38)})
		end)
		RunnableScript["1a"].MouseLeave:Connect(function()
			RunnableScript.Hover = false
			
			Library:tween(RunnableScript["1a"], {BackgroundColor3 = Color3.fromRGB(32, 32, 32)})
			
			if not RunnableScript.Active then
				Library:tween(RunnableScript["1a"], {Transparency = 0})
			end
		end)
		
		uis.InputBegan:Connect(function(input, gpe)
			if gpe then return end
			
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				RunnableScript.Active = true
				
				if RunnableScript.Hover then
					Library:tween(RunnableScript["1a"], {Transparency = 0.3})
					loadstring(options.scriptString)
				end
			end
		end)
		
		uis.InputEnded:Connect(function(input, gpe)
			if gpe then return end
			
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				RunnableScript.Active = false
				if RunnableScript.Hover then
					Library:tween(RunnableScript["1a"], {Transparency = 0})
				end
			end
		end)
		
		return RunnableScript
	end
	
	return GUI
end

UI = Library:Init()
UI:AddUtilScript {
  scriptString = "game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')",
  scriptName = "Infinite Yield",
}

UI:AddGameScript {
  scriptString = "game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt')",
  scriptName = "Butter GUI",
  placeId = 13822889
}

UI:AddGameScript {
  scriptString = "game:HttpGet('https://bit.ly/3x90l99')",
  scriptName = "Toads GUI",
  placeId = 13822889
}
