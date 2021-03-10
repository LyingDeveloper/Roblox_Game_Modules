local GameRound = {}
local active = false

function GameRound.StartRound(intermission, teleport, players, RoundTime)
	wait(intermission)
	active = true
	local pPlayers = {}
	for i, v in ipairs(players) do
		local char = v.Character
		char.HumanoidRootPart.Position = teleport.Position
		table.insert(pPlayers, v)
		char.Humanoid.Died:Connect(function()
			if active == true then
				local p = table.find(pPlayers, v)
				table.remove(pPlayers, p)
			end
		end)
	end
	local survivors = Main(RoundTime, pPlayers)
	return(survivors)
end

function Main(RoundTime, pPlayers)
	for i = RoundTime, 0, -1 do
		print(i)
		wait(1)
	end
	print("Ending Round...")
	for i, v in ipairs(pPlayers) do
		v.Character.Humanoid.Health = 0
	end
    active = false
	return(pPlayers)
end

return GameRound
