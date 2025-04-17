-- Create a simple, black and white themed GUI framework in Lua
local GUI = {}

-- Create the main window
function GUI:CreateWindow(title)
    local window = Instance.new("ScreenGui")
    window.Name = "Window"
    window.DisplayOrder = 10
    window.ResetOnSpawn = false
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Creating main frame of the window
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0) -- 50% width and height
    frame.Position = UDim2.new(0.25, 0, 0.25, 0) -- Center the window
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark background for window
    frame.Parent = window

    -- Adding title to the window
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0) -- Title bar takes 10% of window height
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text for title
    titleLabel.TextSize = 20
    titleLabel.TextAlign = Enum.TextAlign.Center
    titleLabel.Parent = frame

    return window, frame
end

-- Create a tab inside the window
function GUI:CreateTab(window, name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.25, 0, 0.1, 0) -- Tab button size
    tabButton.Position = UDim2.new(0.25 * (#window:GetChildren() - 1), 0, 0.1, 0) -- Positioning tab
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark background for tab
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    tabButton.TextSize = 18
    tabButton.TextAlign = Enum.TextAlign.Center
    tabButton.Parent = window

    -- Creating content frame for the tab
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.9, 0) -- Content takes the rest of the window
    contentFrame.Position = UDim2.new(0, 0, 0.1, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Dark background for content
    contentFrame.Visible = false -- Hidden until tab is clicked
    contentFrame.Parent = window

    -- Toggle content visibility when tab button is clicked
    tabButton.MouseButton1Click:Connect(function()
        contentFrame.Visible = not contentFrame.Visible
    end)

    return contentFrame
end

-- Create a button inside a tab
function GUI:CreateButton(tab, label, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.1, 0) -- Button size
    button.Position = UDim2.new(0, 0, 0, 0) -- Positioning button
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black button background
    button.Text = label
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    button.TextSize = 18
    button.TextAlign = Enum.TextAlign.Center
    button.Parent = tab

    -- Button click action
    button.MouseButton1Click:Connect(function()
        if callback then
            callback() -- Execute the callback when button is clicked
        end
    end)
end

-- Create a label inside a tab
function GUI:CreateLabel(tab, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0.1, 0) -- Label size
    label.Position = UDim2.new(0, 0, 0, 0) -- Positioning label
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    label.TextSize = 18
    label.TextAlign = Enum.TextAlign.Center
    label.Parent = tab
end

return GUI
