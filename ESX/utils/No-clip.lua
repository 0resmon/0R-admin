--[[
	code generated using luamin.js, Herrtt#3868
--]]

--==--==--==--
-- Config
--==--==--==--

config = {
	controls = {
        -- [[Controls, list can be found here : https://docs.fivem.net/game-references/controls/]]
		openKey = 10, -- [[F2]]
		goUp = 85, -- [[Q]]
		goDown = 48, -- [[Z]]
		turnLeft = 34, -- [[A]]
		turnRight = 35, -- [[D]]
		goForward = 32,  -- [[W]]
		goBackward = 33, -- [[S]]
		changeSpeed = 21, -- [[L-Shift]]
	},
	speeds = {
        -- [[If you wish to change the speeds or labels there are associated with then here is the place.]]
		{
			label = "Very Slow",
			speed = 0
		},
		{
			label = "Slow",
			speed = 0.5
		},
		{
			label = "Normal",
			speed = 2
		},
		{
			label = "Fast",
			speed = 4
		},
		{
			label = "Very Fast",
			speed = 6
		},
		{
			label = "Extremely Fast",
			speed = 10
		},
		{
			label = "Extremely Fast v2.0",
			speed = 20
		},
		{
			label = "Max Speed",
			speed = 25
		}
	},
	offsets = {
		y = 0.5, -- [[How much distance you move forward and backward while the respective button is pressed]]
		z = 0.2, -- [[How much distance you move upward and downward while the respective button is pressed]]
		h = 3, -- [[How much you rotate. ]]
	},

    -- [[Background colour of the buttons. (It may be the standard black on first opening, just re-opening.)]]
	bgR = 0, -- [[Red]]
	bgG = 0, -- [[Green]]
	bgB = 0, -- [[Blue]]
	bgA = 80, -- [[Alpha]]
}

 

noclipActive = false  
 
index = 1 -- [[Used to determine the index of the speeds table.]]

function toggleNoclip()
	Citizen.CreateThread(function()
		buttons = setupScaleform("instructional_buttons")
		currentSpeed = config.speeds[index].speed
		while noclipActive do
			Citizen.Wait(1)
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
			else
				noclipEntity = PlayerPedId()
			end
			SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
			FreezeEntityPosition(noclipEntity, noclipActive)
			SetEntityInvincible(noclipEntity, noclipActive)
			SetVehicleRadioEnabled(noclipEntity, not noclipActive) -- [[Stop radio from appearing when going upwards.]]
			if noclipActive then
				DrawScaleformMovieFullscreen(buttons)
				local yoff = 0.0
				local zoff = 0.0
				if IsControlJustPressed(1, config.controls.changeSpeed) then
					if index ~= 8 then
						index = index + 1
						currentSpeed = config.speeds[index].speed
					else
						currentSpeed = config.speeds[1].speed
						index = 1
					end
					setupScaleform("instructional_buttons")
				end
				
				DisableControls()
				if IsDisabledControlPressed(0, config.controls.goForward) then
					yoff = config.offsets.y
				end
				if IsDisabledControlPressed(0, config.controls.goBackward) then
					yoff = -config.offsets.y
				end
				if IsDisabledControlPressed(0, config.controls.turnLeft) then
					SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity) + config.offsets.h)
				end
				if IsDisabledControlPressed(0, config.controls.turnRight) then
					SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity) - config.offsets.h)
				end
				if IsDisabledControlPressed(0, config.controls.goUp) then
					zoff = config.offsets.z
				end
				if IsDisabledControlPressed(0, config.controls.goDown) then
					zoff = -config.offsets.z
				end
				local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
				local heading = GetEntityHeading(noclipEntity)
				SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
				SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
				SetEntityHeading(noclipEntity, heading)
				SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, noclipActive, noclipActive, noclipActive)
			end
		end
	end)

end
