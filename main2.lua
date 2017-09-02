display.setStatusBar (display.HiddenStatusBar)

math.randomseed( os.time() )
math.random() math.random() math.random()

do
   local oldrandom = math.random
   local randomtable
   math.random = function ()
      if randomtable == nil then
         randomtable = {}
         for i = 1, 97 do
            randomtable[i] = oldrandom()
         end
      end
      local x = oldrandom()
      local i = 1 + math.floor(97*x)
      x, randomtable[i] = randomtable[i], x
      return x
   end
end

diceAposX = 300
diceAposY = 700
diceBposX = 800
diceBposY = 700
diceCposX = 300
diceCposY = 1200
diceDposX = 700
diceDposY = 1200

function checkDicesAmount ()
	if chosenDices == 1 then
		diceAposX = 550
		diceAposY = 950
	end

	if chosenDices == 2 then
		diceAposX = 550
		diceAposY = 700
		diceBposX = 550
		diceBposY = 1200
	end

	if chosenDices == 3 then
		diceAposX = 550
		diceAposY = 700
		diceBposX = 280
		diceBposY = 1200
		diceCposX = 800
		diceCposY = 1200
	end

	if chosenDices == 4 then
		diceAposX = 280
		diceAposY = 700
		diceBposX = 800
		diceBposY = 700
		diceCposX = 280
		diceCposY = 1200
		diceDposX = 800
		diceDposY = 1200
	end
end

soundOn = 1
rollingOnce = 0
chosenDices = 1

local path = system.pathForFile ("options.txt", system.DocumentsDirectory)
local file, errorString = io.open (path, "r")

if not file then
	file = io.open (path, "w")
	file:write (soundOn)
	file:write (chosenDices)
	io.close (file)
else
    soundOn = tonumber (file:read (1))
    chosenDices = tonumber (file:read (1))
    io.close (file)
end

if soundOn == 2 then
	soundOn = -1
end

file = nil

checkDicesAmount ()

diceA = display.newImage ("dice1.png")
diceA.x = diceAposX
diceA.y = diceAposY

diceB = display.newImage ("dice1.png")
diceB.x = diceBposX
diceB.y = diceBposY
diceB.isVisible = false

diceC = display.newImage ("dice1.png")
diceC.x = diceCposX
diceC.y = diceCposY
diceC.isVisible = false

diceD = display.newImage ("dice1.png")
diceD.x = diceDposX
diceD.y = diceDposY
diceD.isVisible = false

if chosenDices > 1 then
	diceB.isVisible = true
end

if chosenDices > 2 then
	diceC.isVisible = true
end

if chosenDices > 3 then
	diceD.isVisible = true
end

local options = display.newImage ("options.png")
options.x = 1000
options.y = 80

local dices = display.newImage ("dices2.png")
dices.x = 1000
dices.y = 80
dices.isVisible = false

local optionsMenu = display.newImage ("optionsMenu.png")
optionsMenu.x = 550
optionsMenu.y = 950
optionsMenu.isVisible = false

local pitch = display.newImage ("pitch.png")
pitch.x = 960
pitch.y = 650
pitch.isVisible = false

local box = display.newImage ("box.png")
box.x = 960
box.y = 650
box.isVisible = false

function roll ()
		a = math.floor (math.random () * 6) + 1
		b = math.floor (math.random () * 6) + 1
		c = math.floor (math.random () * 6) + 1
		d = math.floor (math.random () * 6) + 1
		--c = math.floor (a) + math.floor (b) + 2
		print (a, b)
		removeDices ()

		if a == 1 then 
			diceA = display.newImage ("dice1.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if a == 2 then 
			diceA = display.newImage ("dice2.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if a == 3 then 
			diceA = display.newImage ("dice3.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if a == 4 then 
			diceA = display.newImage ("dice4.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if a == 5 then 
			diceA = display.newImage ("dice5.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if a == 6 then 
			diceA = display.newImage ("dice6.png")
			diceA.x = diceAposX
			diceA.y = diceAposY
		end

		if b == 1 and chosenDices > 1 then 
			diceB = display.newImage ("dice1.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if b == 2 and chosenDices > 1 then 
			diceB = display.newImage ("dice2.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if b == 3 and chosenDices > 1 then 
			diceB = display.newImage ("dice3.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if b == 4 and chosenDices > 1 then 
			diceB = display.newImage ("dice4.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if b == 5 and chosenDices > 1 then 
			diceB = display.newImage ("dice5.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if b == 6 and chosenDices > 1 then 
			diceB = display.newImage ("dice6.png")
			diceB.x = diceBposX
			diceB.y = diceBposY
		end

		if c == 1 and chosenDices > 2 then 
			diceC = display.newImage ("dice1.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if c == 2 and chosenDices > 2 then 
			diceC = display.newImage ("dice2.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if c == 3 and chosenDices > 2 then 
			diceC = display.newImage ("dice3.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if c == 4 and chosenDices > 2 then 
			diceC = display.newImage ("dice4.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if c == 5 and chosenDices > 2 then 
			diceC = display.newImage ("dice5.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if c == 6 and chosenDices > 2 then 
			diceC = display.newImage ("dice6.png")
			diceC.x = diceCposX
			diceC.y = diceCposY
		end

		if d == 1 and chosenDices > 3 then 
			diceD = display.newImage ("dice1.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end

		if d == 2 and chosenDices > 3 then 
			diceD = display.newImage ("dice2.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end

		if d == 3 and chosenDices > 3 then 
			diceD = display.newImage ("dice3.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end

		if d == 4 and chosenDices > 3 then 
			diceD = display.newImage ("dice4.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end

		if d == 5 and chosenDices > 3 then 
			diceD = display.newImage ("dice5.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end

		if d == 6 and chosenDices > 3 then 
			diceD = display.newImage ("dice6.png")
			diceD.x = diceDposX
			diceD.y = diceDposY
		end
end

function removeDices ()
	diceA : removeSelf ()
	diceA = nil

	if chosenDices > 1 then
		diceB : removeSelf ()
		diceB = nil
	end

	if chosenDices > 2 then
		diceC : removeSelf ()
		diceC = nil
	end

	if chosenDices > 3 then
		diceD : removeSelf ()
		diceD = nil
	end
end

--Runtime:addEventListener ("enterFrame", roll)
function enterOptions ()
	diceA.isVisible = false
	diceB.isVisible = false
	diceC.isVisible = false
	diceD.isVisible = false
	options.isVisible = false
	dices.isVisible = true
	optionsMenu.isVisible = true

	if soundOn == 1 then
		pitch.isVisible = true
	end

	box.x = 290 + chosenDices * 165
	box.y = 910
	box.isVisible = true
end

function enterDices ()
	checkDicesAmount ()
	diceA.isVisible = true
	diceA.x = diceAposX
	diceA.y = diceAposY

	if chosenDices > 1 then
		diceB.isVisible = true
		diceB.x = diceBposX
		diceB.y = diceBposY
	end

	if chosenDices > 2 then
		diceC.isVisible = true
		diceC.x = diceCposX
		diceC.y = diceCposY
	end

	if chosenDices > 3 then
		diceD.isVisible = true
		diceD.x = diceDposX
		diceD.y = diceDposY
	end

	options.isVisible = true
	dices.isVisible = false
	optionsMenu.isVisible = false
	pitch.isVisible = false
	box.isVisible = false
end

function writeOptions ()
	file = io.open (path, "w")

	if soundOn == -1 then
		soundOn = 2
	end

	file:write (soundOn)

	if soundOn == 2 then
		soundOn = -1
	end

	file:write (chosenDices)
	io.close (file)
	file = nil
end

function touchScreen (event)
	x = event.x
	y = event.y

	if event.phase == "began" then
		if rollingOnce == 0 and x > 950 and y < 150 then
			enterOptions ()
			rollingOnce = 2
		elseif rollingOnce == 0 then
			rollingOnce = 1

			if soundOn == 1 then
				audio.play (diceSound)
			end
		elseif rollingOnce == 2 and x > 950 and y < 150 then
			rollingOnce = 0
			enterDices ()
		elseif rollingOnce == 2 and x > 850 and y < 750 and y > 550 then
			soundOn = soundOn * (-1)
			writeOptions ()

			if soundOn == -1 then
				pitch.isVisible = false
			else
				pitch.isVisible = true
			end
		elseif rollingOnce == 2 then
			if x > 400 and x < 500 and y > 860 and y < 980 then
				chosenDices = 1
			elseif x > 570 and x < 670 and y > 860 and y < 980 then
				chosenDices = 2
			elseif x > 735 and x < 835 and y > 860 and y < 980 then
				chosenDices = 3
			elseif x > 900 and x < 1000 and y > 860 and y < 980 then
				chosenDices = 4
			end

			box.x = 290 + chosenDices * 165
			box.y = 910
			writeOptions ()
		end
	end
end

Runtime:addEventListener ("touch", touchScreen)

timeDelay = 0

function fn_counter ()
	if rollingOnce == 1 then
		timeDelay = timeDelay + 1
	end

	if timeDelay == 5 or timeDelay == 10 or timeDelay == 15 or timeDelay == 20 or timeDelay == 25 then
		roll ()

		if timeDelay < 25 then
			diceA:setFillColor (128, 128, 128)
			diceB:setFillColor (128, 128, 128)
			diceC:setFillColor (128, 128, 128)
			diceD:setFillColor (128, 128, 128)
		else
			diceA:setFillColor (255, 255, 255)
			diceB:setFillColor (255, 255, 255)
			diceC:setFillColor (255, 255, 255)
			diceD:setFillColor (255, 255, 255)
		end
	end

	if timeDelay == 30 then
		timeDelay = 0
		rollingOnce = 0
	end
end

timer.performWithDelay (1, fn_counter, 0)

diceSound = audio.loadSound( "move.wav" )