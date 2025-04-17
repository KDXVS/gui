-- This script will create a basic framework for a black-and-white themed GUI

local GUI = {}

-- Create the main window function
function GUI:CreateWindow(title)
    local window = Instance.new("ScreenGui")
    window.Name = "Window"
    window.DisplayOrder = 10
    window.ResetOnSpawn = false
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the main frame for the window
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)  -- 50% width and height of the screen
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)  -- Center the window
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark background
    frame.Parent = window

    -- Title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0)  -- 10% height of the frame for the title
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White title text
    titleLabel.TextSize = 20
    titleLabel.TextAlign = Enum.TextAlign.Center
    titleLabel.Parent = frame

    return window, frame
end

-- Function to create tabs
function GUI:CreateTab(window, name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.25, 0, 0.1, 0)  -- Tab button size
    tabButton.Position = UDim2.new(0.25 * (#window:GetChildren() - 1), 0, 0.1, 0)  -- Tab button position
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Dark background for the tab
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text for tab
    tabButton.TextSize = 18
    tabButton.TextAlign = Enum.TextAlign.Center
    tabButton.Parent = window

    -- Frame for the tab content
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.9, 0)  -- Content frame takes the remaining space
    contentFrame.Position = UDim2.new(0, 0, 0.1, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Dark background for content
    contentFrame.Visible = false  -- Hide until tab is clicked
    contentFrame.Parent = window

    -- Toggle the visibility of content when tab is clicked
    tabButton.MouseButton1Click:Connect(function()
        contentFrame.Visible = not contentFrame.Visible
    end)

    return contentFrame
end

-- Function to create buttons inside tabs
function GUI:CreateButton(tab, label, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.1, 0)  -- Button size
    button.Position = UDim2.new(0, 0, 0, 0)  -- Position button at the top
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black button background
    button.Text = label
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    button.TextSize = 18
    button.TextAlign = Enum.TextAlign.Center
    button.Parent = tab

    -- Button click action
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()  -- Execute the callback when the button is clicked
        end
    end)
end

-- Return the GUI framework to be used later
return GUI
