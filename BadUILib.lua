-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")

-- Variables
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)


local Library = {}

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
	options = Library:validate({
		name = "Name"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main
	do 
		-- StarterGui.CLib
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[CLib]];
		GUI["1"]["IgnoreGuiInset"] = true

		-- StarterGui.CLib.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.CLib.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 7);
		
		-- StarterGui.CLib.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.CLib.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			
		-- StarterGui.CLib.Main.ContentContainer
		GUI["1b"] = Instance.new("Frame", GUI["2"]);
		GUI["1b"]["BorderSizePixel"] = 0;
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1b"]["BackgroundTransparency"] = 1;
		GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1b"]["Name"] = [[ContentContainer]];
		
	end
	
	-- Top Bar
	do
		-- StarterGui.CLib.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(0, 126, 255);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["Name"] = [[TopBar]];

		-- StarterGui.CLib.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 7);

		-- StarterGui.CLib.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(0, 126, 255);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["Name"] = [[Extension]];

		-- StarterGui.CLib.Main.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["TextWrapped"] = true;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["9"]["TextSize"] = 14;
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["Text"] = options["name"];
		GUI["9"]["Name"] = options["name"];
		GUI["9"]["BackgroundTransparency"] = 1;

		-- StarterGui.CLib.Main.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.CLib.Main.TopBar.close
		GUI["b"] = Instance.new("ImageButton", GUI["6"]);
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["b"]["Image"] = [[rbxassetid://3926305904]];
		GUI["b"]["ImageRectSize"] = Vector2.new(24, 24);
		GUI["b"]["Size"] = UDim2.new(0, 25, 0, 25);
		GUI["b"]["Name"] = [[close]];
		GUI["b"]["ImageRectOffset"] = Vector2.new(284, 4);
		GUI["b"]["Position"] = UDim2.new(1, -1, 0, 2);
		GUI["b"]["BackgroundTransparency"] = 1;
	end
	
	-- Navigation
	do 
		-- StarterGui.CLib.Main.Navigation
		GUI["c"] = Instance.new("Frame", GUI["2"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		GUI["c"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["c"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["c"]["Name"] = [[Navigation]];

		-- StarterGui.CLib.Main.Navigation.UICorner
		GUI["d"] = Instance.new("UICorner", GUI["c"]);


		-- StarterGui.CLib.Main.Navigation.Hide
		GUI["e"] = Instance.new("Frame", GUI["c"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		GUI["e"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["e"]["Name"] = [[Hide]];

		-- StarterGui.CLib.Main.Navigation.Hide2
		GUI["f"] = Instance.new("Frame", GUI["c"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		GUI["f"]["Size"] = UDim2.new(0, -20, 1, 0);
		GUI["f"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["f"]["Name"] = [[Hide2]];

		-- StarterGui.CLib.Main.Navigation.ButtonHolder
		GUI["10"] = Instance.new("Frame", GUI["c"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
		GUI["10"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["10"]["Name"] = [[ButtonHolder]];

		-- StarterGui.CLib.Main.Navigation.ButtonHolder.UIPadding
		GUI["11"] = Instance.new("UIPadding", GUI["10"]);
		GUI["11"]["PaddingTop"] = UDim.new(0, 8);
		GUI["11"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.CLib.Main.Navigation.ButtonHolder.UIListLayout
		GUI["12"] = Instance.new("UIListLayout", GUI["10"]);
		GUI["12"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		GUI["12"]["Padding"] = UDim.new(0, 1);
		GUI["12"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end
	
	function GUI:CreateTab(options)
		options = Library:validate({
			name = "Preview Tab",
			icon = "rbxassetid://12585588894"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- Render
		do
			-- StarterTab.CLib.Main.Navigation.ButtonHolder.Inactive
			Tab["17"] = Instance.new("TextLabel", GUI["10"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
			Tab["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["17"]["TextSize"] = 12;
			Tab["17"]["TextColor3"] = Color3.fromRGB(180, 180, 180);
			Tab["17"]["Size"] = UDim2.new(0.8999999761581421, 0, 0, 24);
			Tab["17"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
			Tab["17"]["Text"] = options.name;
			Tab["17"]["Name"] = [[Inactive]];
			Tab["17"]["BackgroundTransparency"] = 1;

			-- StarterTab.CLib.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["18"] = Instance.new("UIPadding", Tab["17"]);
			Tab["18"]["PaddingLeft"] = UDim.new(0, 28);

			-- StarterTab.CLib.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["ImageColor3"] = Color3.fromRGB(180, 180, 180)
			Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["19"]["Image"] = options.icon;
			Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["19"]["Name"] = [[Icon]];
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Position"] = UDim2.new(0, -24, 0.5, 0);

			-- StarterTab.CLib.Main.Navigation.ButtonHolder.Inactive.UICorner
			Tab["1a"] = Instance.new("UICorner", Tab["17"]);
			Tab["1a"]["CornerRadius"] = UDim.new(0, 3);
			
			-- StarterGui.CLib.Main.ContentContainer.HomeTab
			Tab["1c"] = Instance.new("ScrollingFrame", GUI["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["Selectable"] = false;
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["Name"] = [[HomeTab]];
			Tab["1c"]["SelectionGroup"] = false;
			Tab["1c"]["Visible"] = false;
			
			-- StarterGui.CLib.Main.ContentContainer.HomeTab.UIListLayout
			Tab["27"] = Instance.new("UIListLayout", Tab["1c"]);
			Tab["27"]["Padding"] = UDim.new(0, 6);
			Tab["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			-- StarterGui.CLib.Main.ContentContainer.HomeTab.UIPadding
			Tab["21"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["21"]["PaddingTop"] = UDim.new(0, 1);
			Tab["21"]["PaddingRight"] = UDim.new(0, 1);
			Tab["21"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["21"]["PaddingLeft"] = UDim.new(0, 1);
		end
		
		-- Methods
		do
			function Tab:Activate()
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["17"], {BackgroundTransparency = 0})
				Tab["1c"].Visible = true
				

				GUI.CurrentTab = Tab
			end

			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(180, 180, 180)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(180, 180, 180)})
					Library:tween(Tab["17"], {BackgroundTransparency = 1})
					Tab["1c"].Visible = true
				end
			end
		end
		
		-- Logic
		do
			Tab["17"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["17"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(180, 180, 180)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(180, 180, 180)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)


			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				text = "Preview Button Text",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Button
				Button["1d"] = Instance.new("Frame", Tab["1c"]);
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
				Button["1d"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1d"]["Name"] = [[Button]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Button.UICorner
				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Button.Title
				Button["1f"] = Instance.new("TextLabel", Button["1d"]);
				Button["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["1f"]["TextSize"] = 14;
				Button["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["1f"]["Text"] = options.text;
				Button["1f"]["Name"] = [[Title]];
				Button["1f"]["BackgroundTransparency"] = 1;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["20"] = Instance.new("UIPadding", Button["1d"]);
				Button["20"]["PaddingTop"] = UDim.new(0, 6);
				Button["20"]["PaddingRight"] = UDim.new(0, 6);
				Button["20"]["PaddingBottom"] = UDim.new(0, 6);
				Button["20"]["PaddingLeft"] = UDim.new(0, 6);
			end
			
			-- Methods
			function Button:UpdateText(text)
				Button["1f"].Text = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			-- Logic
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["1d"], {BackgroundTransparency = 0.25})
				end)
				
				Button["1d"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["1d"], {BackgroundTransparency = 0})
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Library:tween(Button["1d"], {BackgroundTransparency = 0.25})
						options.callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							-- Hover State
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Button["1d"], {BackgroundTransparency = 0.25})
						else
							-- Reset
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Button["1d"], {BackgroundTransparency = 0})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:Label(options)
			options = Library:validate({
				text = "Preview Label Text"
			}, options or {})
			
			local Label = {}
			
			-- Render
			do
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Label
				Label["22"] = Instance.new("Frame", Tab["1c"]);
				Label["22"]["BackgroundColor3"] = Color3.fromRGB(56, 54, 0);
				Label["22"]["Size"] = UDim2.new(1, 0, 0, 26);
				Label["22"]["Name"] = "Label";

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Label.UICorner
				Label["23"] = Instance.new("UICorner", Label["22"]);
				Label["23"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Label.UIStroke
				Label["24"] = Instance.new("UIStroke", Label["22"]);
				Label["24"]["Color"] = Color3.fromRGB(84, 80, 0);
				Label["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Label.Text
				Label["25"] = Instance.new("TextLabel", Label["22"]);
				Label["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["25"]["TextSize"] = 14;
				Label["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["25"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["25"]["Name"] = options.text;
				Label["25"]["BackgroundTransparency"] = 1;
				Label["25"]["TextWrapped"] = true
				Label["25"]["TextYAlignment"] = Enum.TextYAlignment.Top

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Label.UIPadding
				Label["26"] = Instance.new("UIPadding", Label["22"]);
				Label["26"]["PaddingTop"] = UDim.new(0, 6);
				Label["26"]["PaddingRight"] = UDim.new(0, 6);
				Label["26"]["PaddingBottom"] = UDim.new(0, 6);
				Label["26"]["PaddingLeft"] = UDim.new(0, 6);
			end
			
			-- Methods
			do 
				function Label:UpdateText(text)
					options.text = text
					Label["25"].Text = text
					Label:_update()				
				end
				
				function Label:_update()
					Label["25"].Text = options.text
					
					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, math.huge)
					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, Label["25"].TextBounds.Y)
					Library:tween(Label["22"], {Size = UDim2.new(Label["22"].Size.X.Scale, Label["22"].Size.X.Offset, 0, Label["25"].TextBounds.Y + 12)})
					end
			end
			
			Label:_update()
			return Label
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Preview Title",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["45"] = Instance.new("Frame", Tab["1c"]);
				Toggle["45"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				Toggle["45"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["45"]["Name"] = [[ToggleInactive]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["46"] = Instance.new("UICorner", Toggle["45"]);
				Toggle["46"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["47"] = Instance.new("TextLabel", Toggle["45"]);
				Toggle["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["47"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["47"]["TextSize"] = 14;
				Toggle["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["47"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["47"]["Text"] = [[Toggle]];
				Toggle["47"]["Name"] = [[Title]];
				Toggle["47"]["BackgroundTransparency"] = 1;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["48"] = Instance.new("UIPadding", Toggle["45"]);
				Toggle["48"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["48"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["48"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["48"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["49"] = Instance.new("Frame", Toggle["45"]);
				Toggle["49"]["BorderSizePixel"] = 0;
				Toggle["49"]["BackgroundColor3"] = Color3.fromRGB(120, 120, 120);
				Toggle["49"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["49"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["49"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["49"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["4a"] = Instance.new("UICorner", Toggle["49"]);
				Toggle["4a"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["4b"] = Instance.new("ImageLabel", Toggle["49"]);
				Toggle["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["4b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["4b"]["Image"] = [[rbxassetid://12586337755]];
				Toggle["4b"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["4b"]["Name"] = [[Checkmark]];
				Toggle["4b"]["BackgroundTransparency"] = 1;
				Toggle["4b"]["ImageTransparency"] = 1;
				Toggle["4b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			end
			
			-- Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(0, 77, 150)})
						Library:tween(Toggle["4b"], {ImageTransparency = 0})
					else
						Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(120, 120, 120)})
						Library:tween(Toggle["4b"], {ImageTransparency = 1})
					end

					options.callback(Toggle.State)
				end
			end
			
			-- Logic
			do
				Toggle["45"].MouseEnter:Connect(function()
					Toggle.Hover = true
					
					Library:tween(Toggle["45"], {BackgroundTransparency = 0.25})
				end)

				Toggle["45"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["45"], {BackgroundTransparency = 0})
					end
				end)
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["45"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Library:tween(Toggle["45"], {BackgroundTransparency = 0.25})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							-- Hover State
							Library:tween(Toggle["45"], {BackgroundColor3 = Color3.fromRGB(26, 26, 26)})
							Library:tween(Toggle["45"], {BackgroundTransparency = 0.25})
						else
							-- Reset
							Library:tween(Toggle["45"], {BackgroundColor3 = Color3.fromRGB(26, 26, 26)})
							Library:tween(Toggle["45"], {BackgroundTransparency = 0})
						end
					end
				end)
				return Toggle
			end
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Preview Title",
				min = 0,
				max = 100,
				default = 500,
				callback = function(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			-- Render
			do
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider
				Slider["28"] = Instance.new("Frame", Tab["1c"]);
				Slider["28"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				Slider["28"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["28"]["Name"] = [[Slider]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["29"] = Instance.new("UICorner", Slider["28"]);
				Slider["29"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.Title
				Slider["2a"] = Instance.new("TextLabel", Slider["28"]);
				Slider["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["2a"]["TextSize"] = 14;
				Slider["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2a"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["2a"]["Text"] = options.title;
				Slider["2a"]["Name"] = [[Title]];
				Slider["2a"]["BackgroundTransparency"] = 1;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["2b"] = Instance.new("UIPadding", Slider["28"]);
				Slider["2b"]["PaddingTop"] = UDim.new(0, 6);
				Slider["2b"]["PaddingRight"] = UDim.new(0, 6);
				Slider["2b"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["2b"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.Value
				Slider["2c"] = Instance.new("TextLabel", Slider["28"]);
				Slider["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2c"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["2c"]["TextSize"] = 14;
				Slider["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2c"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["2c"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["2c"]["Text"] = tostring(options.default);
				Slider["2c"]["Name"] = [[Value]];
				Slider["2c"]["BackgroundTransparency"] = 1;
				Slider["2c"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["2d"] = Instance.new("Frame", Slider["28"]);
				Slider["2d"]["BorderSizePixel"] = 0;
				Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["2d"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["2d"]["Size"] = UDim2.new(1, 0, 0, 6);
				Slider["2d"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["2d"]["Name"] = [[SliderBack]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["2e"] = Instance.new("UICorner", Slider["2d"]);
				Slider["2e"]["CornerRadius"] = UDim.new(0, 6);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["2f"] = Instance.new("UIStroke", Slider["2d"]);
				Slider["2f"]["Color"] = Color3.fromRGB(0, 51, 101);
				Slider["2f"]["Thickness"] = 0.800000011920929;
				Slider["2f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["30"] = Instance.new("Frame", Slider["2d"]);
				Slider["30"]["BackgroundColor3"] = Color3.fromRGB(0, 77, 149);
				Slider["30"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["30"]["Name"] = [[Draggable]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["31"] = Instance.new("UICorner", Slider["30"]);
				Slider["31"]["CornerRadius"] = UDim.new(0, 6);
			end
			
			-- Methods
			do
				function Slider:SetValue(v)
					if v == nil then
						local percentage = math.clamp((mouse.X - Slider["2d"].AbsolutePosition.X) / (Slider["2d"].AbsoluteSize.X), 0, 1)
						local value = math.floor(((options.max - options.min) * percentage) + options.min)

						Slider["2c"].Text = tostring(value)
						Slider["30"].Size = UDim2.fromScale(percentage, 1)
					else
						Slider["2c"].Text = tostring(v)
						Slider["30"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
					end
					options.callback(Slider:GetValue())
				end
				
				function Slider:GetValue()
					return tonumber(Slider["2c"].Text)
				end
			end
			
			-- Logic
			do
				Slider["28"].MouseEnter:Connect(function()
					Slider.Hover = true
					Library:tween(Slider["28"], {BackgroundTransparency = 0.25})
				end)

				Slider["28"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["28"], {BackgroundTransparency = 0})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["28"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Library:tween(Slider["28"], {BackgroundTransparency = 0.25})
						
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							-- Hover State
							Library:tween(Slider["28"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Slider["28"], {BackgroundTransparency = 0})
						else
							-- Reset
							Library:tween(Slider["28"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Slider["28"], {BackgroundTransparency = 0})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:Dropdown(options)
			options = Library:validate({
				title = "Preview Title",
				callback = function(v) end,
				items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["id"] = {
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false,
			}
			
			-- Render
			do
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown
				Dropdown["32"] = Instance.new("Frame", Tab["1c"]);
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				Dropdown["32"]["Size"] = UDim2.new(1, 0, 0, 32);
				Dropdown["32"]["ClipsDescendants"] = true;
				Dropdown["32"]["Name"] = [[Dropdown]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.UICorner
				Dropdown["33"] = Instance.new("UICorner", Dropdown["32"]);
				Dropdown["33"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.TItle
				Dropdown["34"] = Instance.new("TextLabel", Dropdown["32"]);
				Dropdown["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["34"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["34"]["TextSize"] = 14;
				Dropdown["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["34"]["Size"] = UDim2.new(1, -20, 0, 20);
				Dropdown["34"]["Text"] = options.title;
				Dropdown["34"]["Name"] = [[TItle]];
				Dropdown["34"]["BackgroundTransparency"] = 1;

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.UIPadding
				Dropdown["35"] = Instance.new("UIPadding", Dropdown["32"]);
				Dropdown["35"]["PaddingTop"] = UDim.new(0, 6);
				Dropdown["35"]["PaddingRight"] = UDim.new(0, 6);
				Dropdown["35"]["PaddingBottom"] = UDim.new(0, 6);
				Dropdown["35"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.Icon
				Dropdown["36"] = Instance.new("ImageLabel", Dropdown["32"]);
				Dropdown["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["36"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["36"]["Image"] = [[rbxassetid://12586074360]];
				Dropdown["36"]["Size"] = UDim2.new(0, 20, 0, 20);
				Dropdown["36"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
				Dropdown["36"]["Name"] = [[Icon]];
				Dropdown["36"]["BackgroundTransparency"] = 1;
				Dropdown["36"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.OptionHolder
				Dropdown["37"] = Instance.new("Frame", Dropdown["32"]);
				Dropdown["37"]["BorderSizePixel"] = 0;
				Dropdown["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["37"]["BackgroundTransparency"] = 1;
				Dropdown["37"]["Size"] = UDim2.new(1, 0, 1, -24);
				Dropdown["37"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["37"]["Visible"] = false;
				Dropdown["37"]["Name"] = [[OptionHolder]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["38"] = Instance.new("UIListLayout", Dropdown["37"]);
				Dropdown["38"]["Padding"] = UDim.new(0, 4);
				Dropdown["38"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			
			-- Methods
			function Dropdown:Add(value, id)
				local Item = {
					Hover = false,
					MouseDown = false
				}
				if Dropdown.Items[id] ~= nil then
					return
				end
				
				Dropdown.Items[id] = {
					instance = {},
					value = value
				}
				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.InactiveOption
				Dropdown.Items[id].instance["39"] = Instance.new("TextLabel", Dropdown["37"]);
				Dropdown.Items[id].instance["39"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Dropdown.Items[id].instance["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown.Items[id].instance["39"]["TextSize"] = 12;
				Dropdown.Items[id].instance["39"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
				Dropdown.Items[id].instance["39"]["Size"] = UDim2.new(1, 0, 0, 16);
				Dropdown.Items[id].instance["39"]["Text"] = id;
				Dropdown.Items[id].instance["39"]["Name"] = [[InactiveOption]];

				-- StarterGui.CLib.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.InactiveOption.UICorner
				Dropdown.Items[id].instance["z1"] = Instance.new("UICorner", Dropdown["39"]);
				Dropdown.Items[id].instance["z1"]["CornerRadius"] = UDim.new(0, 3);
				
				Dropdown.Items[id].instance["39"].MouseEnter:Connect(function()
					Item.Hover = true
					Dropdown.HoveringItem = true
					
					Library:tween(Dropdown.Items[id].instance["39"], {BackgroundTransparency = 0.25})
				end)

				Dropdown.Items[id].instance["39"].MouseLeave:Connect(function()
					Item.Hover = false
					Dropdown.HoveringItem = false

					if not Item.MouseDown then
						Library:tween(Dropdown.Items[id].instance["39"], {BackgroundTransparency = 0})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if Dropdown.Items[id] == nil then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
						Item.MouseDown = true
						Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Library:tween(Dropdown.Items[id].instance["39"], {BackgroundTransparency = 0.25})
						Dropdown:Toggle()
						options.callback(value)
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end
					
					if Dropdown.Items[id] == nil then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Item.MouseDown = false

						if Item.Hover then
							-- Hover State
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundTransparency = 0.25})
						else
							-- Reset
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
							Library:tween(Dropdown.Items[id].instance["39"], {BackgroundTransparency = 0})
						end
					end
				end)
			end
			
			function Dropdown:Remove(id)
				if Dropdown.Items[id] ~= nil then
					if #Dropdown.Items[id].instance ~= nil then
						for i, v in pairs(Dropdown.Items[id].instance) do
							v:Destroy()
						end
						Dropdown.Items[id] = nil
					end
				end
			end
			
			function Dropdown:Clear()
				for i, v in pairs(Dropdown.Items) do
					Dropdown.Remove(i)
				end
			end
			
			function Dropdown:Toggle()
				if Dropdown.Open then
					Library:tween(Dropdown["32"], {Size = UDim2.new(1, 0, 0, 30)}, function() end)
					wait(0.1)
					Dropdown["37"].Visible = false
				else
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end
					Library:tween(Dropdown["32"], {Size = UDim2.new(1, 0, 0, 30 + (count * 16) + 1)})
					Dropdown["37"].Visible = true
				end
				Dropdown.Open = not Dropdown.Open
			end
			
			-- Logic
			do
				Dropdown["32"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					Library:tween(Dropdown["32"], {BackgroundTransparency = 0.25})
				end)

				Dropdown["32"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Library:tween(Dropdown["32"], {BackgroundTransparency = 0})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Library:tween(Dropdown["32"], {BackgroundTransparency = 0.25})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							-- Hover State
							Library:tween(Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Dropdown["32"], {BackgroundTransparency = 0.25})
						else
							-- Reset
							Library:tween(Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
							Library:tween(Dropdown["32"], {BackgroundTransparency = 0})
						end
					end
				end)
			end
			
			return Dropdown
		end
		
		return Tab
	end
	
	return GUI
end
