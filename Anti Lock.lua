local UserInputService = game:GetService("UserInputService")

local function togglePredictionBreaker()
_G.PredictionBreaker = not _G.PredictionBreaker
if _G.PredictionBreaker then
game.StarterGui:SetCore("SendNotification", {
Title = "On";
Text = "On";
Duration = 0.1;
})
else
game.StarterGui:SetCore("SendNotification", {
Title = "Off";
Text = "Off";
Duration = 0.1;
})
end
end

UserInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
if inputObject.KeyCode == Enum.KeyCode.KeypadPlus then
togglePredictionBreaker()
end
end)

game.RunService.Heartbeat:Connect(function()
if _G.PredictionBreaker then
local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game.RunService.RenderStepped:Wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
end
end)