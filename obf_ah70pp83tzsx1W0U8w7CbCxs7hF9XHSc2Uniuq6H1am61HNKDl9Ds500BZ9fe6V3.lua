-- Simple Movable GUI Framework
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

    -- Make the window draggable by clicking and holding the title label
    local dragging = false
    local dragInput, dragStart, startPos

    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    titleLabel.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    titleLabel.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return window, frame
end

-- Function to create buttons inside the window
function GUI:CreateButton(window, label, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.1, 0)  -- Button size
    button.Position = UDim2.new(0.1, 0, 0.3, 0)  -- Position button at the center of the window
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black button background
    button.Text = label
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    button.TextSize = 18
    button.TextAlign = Enum.TextAlign.Center
    button.Parent = window

    -- Button click action
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()  -- Execute the callback when the button is clicked
        end
    end)
end

-- Return the GUI framework to be used later
return GUI
