local RunService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")

local scriptOn = false

local function sendNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Resolver";
        Text = message;
        Duration = 0.1;
    })
end

local function toggleScript()
    scriptOn = not scriptOn
    if scriptOn then
        sendNotification("On.")
    else
        sendNotification("Off.")
    end
end

InputService.InputBegan:Connect(function(inputObject)
    if inputObject.KeyCode == Enum.KeyCode.KeypadThree then
        toggleScript()
    end
end)

RunService.Heartbeat:Connect(function()
    pcall(function()
        if scriptOn then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local hrp = v.Character.HumanoidRootPart
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)   
                end
            end
        end
    end)
end)