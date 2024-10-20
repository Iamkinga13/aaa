local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flying = false
local flySpeed = 50

-- Function to toggle flying
local function toggleFlying()
    flying = not flying

    if flying then
        humanoid.PlatformStand = true -- Disable character controls
        while flying do
            wait(0.1) -- Adjust the wait time for smoother flight
            local camera = workspace.CurrentCamera
            local direction = camera.CFrame.LookVector
            character:Move(direction * flySpeed) -- Move the character in the camera's direction
            character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame + Vector3.new(0, 1, 0)) -- Adjust height
        end
        humanoid.PlatformStand = false -- Re-enable character controls
    end
end

-- Input handling
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Y then
        toggleFlying()
    end
end)
