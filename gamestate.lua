require("ship")
require("fire")
require("background")
require("score")
require("sodapop") --Animation library not created by our team
require("bullets")
require("enemies")
require("shop")
require("Class")
require("GUIElements/GUIMain")

function gamestate_load()
resMod=1      ----- at 0.5 is the best example of what it will look like on an iphone
screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()

go = love.graphics.newImage("img/game over.png")
win = love.graphics.newImage("img/you win .png")
lvl = love.graphics.newImage("img/level cleared.png")
title = love.graphics.newImage("img/Title.png")
	

button = {
		img = love.graphics.newImage("img/play.png"),
		x = screenWidth/8,
		y = screenHeight/2,
		width = 573*resMod,
		height = 68*resMod
}

shop = {
		img = love.graphics.newImage("img/shop.png"),
		x = screenWidth/2 - (258/2),
		y = screenHeight - 74*2,
		width = 258,
		height = 74
}

gamestate = "title"
end

function gamestate_draw()
if gamestate == "playing" then 
		love.graphics.setBackgroundColor(200,200,200)
		background:draw()
		fire:draw()
		player:draw()
		bullets_draw(dt)
		myScore:draw()


		for i = 1,#enemies do 
			enemies[i]:draw()
		end
	elseif gamestate == "deathscreen" then 
		background:draw()
		myScore:draw()
		bg.n=1
		
		love.graphics.draw(button.img, button.x, button.y, 0, resMod, resMod)
		if insideBox(love.mouse.getX(), love.mouse.getY(), button.x, button.y, button.width, button.height ) then
			gamestate = "playing"
			for i = 1,#enemies do 
				enemies[i]:reset()
				myScore.score = 0
			end
		end

		love.graphics.draw(go, screenWidth/33, screenHeight/5, 0, resMod, resMod)
	elseif gamestate == "win" then 
		bg.n=1
		love.graphics.setBackgroundColor(100,255,100)
		love.graphics.draw(win, screenWidth/75, screenHeight/5, 0, resMod, resMod)
		myScore:draw()

		love.graphics.draw(button.img, button.x, button.y, 0, resMod, resMod)
		if insideBox(love.mouse.getX(), love.mouse.getY(), button.x, button.y, button.width, button.height ) then
			gamestate = "playing"
			for i = 1,#enemies do 
				enemies[i]:reset()
				myScore.score = 0
			end
		end
	elseif gamestate == "title" then
		love.graphics.draw(title, screenWidth/33, screenHeight/30, 0, resMod, resMod)
		love.graphics.draw(button.img, button.x, button.y, 0, resMod, resMod)
		love.graphics.setBackgroundColor(200,200,200)
		if insideBox(love.mouse.getX(), love.mouse.getY(), button.x, button.y, button.width, button.height ) then
			gamestate = "playing"
		end 

		love.graphics.draw(shop.img, shop.x, shop.y)
		if insideBox(love.mouse.getX(), love.mouse.getY(), shop.x, shop.y, shop.width, shop.height ) then
			gamestate = "shop"
		end 


	elseif gamestate == "shop" then 
		shop_draw()		

	end 
end
function gamestate_update(dt)
	if gamestate == "playing" then 
		player:update(dt)
		fire:update(dt)
		background:update(dt)
		myScore:update(dt)
		bullets_update(dt)
        
		for i = 1,#enemies do 
			enemies[i]:update(dt)
		end 
	elseif gamestate == "shop" then 
		shop_update(dt)
	end 
end