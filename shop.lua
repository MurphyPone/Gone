
require("Class")
require("GUIElements/GUIMain")
require("score")

function giveTheme(element)
    element.backgroundColor = {200,100,100}
    element.borderColor = {100,100,100}
    element.toolTipVisible = true
    element.toolTipText = "Upgrade: "..element.name
 
end

function shop_load()
    love.graphics.setFont(love.graphics.setNewFont(10))
    love.graphics.setBackgroundColor(0,0,0)

    back = {
        img = love.graphics.newImage("img/back.png"),
        width = 173*resMod,
        height = 48*resMod,
        x = screenWidth/33,
        y = screenHeight*0.8
    } 
    
    local pieceSize = 100
    local pieceDrawSize = pieceSize - 1
   

    CheckBox:new("One")

    One.position = { (1 - 1) * pieceSize,
                    (1 - 1) * pieceSize}

    giveTheme(One)

    CheckBox:new("Two")
    Two.position = { (2 - 1) * pieceSize,
                    (1 - 1) * pieceSize}
    giveTheme(Two)

    CheckBox:new("Three")
    Three.position = { (3 - 1) * pieceSize,
                    (1 - 1) * pieceSize}
    giveTheme(Three)
    
     CheckBox:new("Four")
    Four.position = { (1 - 1) * pieceSize,
                    (2 - 1) * pieceSize}
    giveTheme(Four)

     CheckBox:new("Five")
    Five.position = { (2 - 1) * pieceSize,
                    (2 - 1) * pieceSize}
    giveTheme(Five)

    CheckBox:new("Six")
    Six.position = { (3 - 1) * pieceSize,
                    (2 - 1) * pieceSize}
    giveTheme(Six)

    CheckBox:new("Seven")
    Seven.position = { (1 - 1) * pieceSize,
                    (3 - 1) * pieceSize}
    giveTheme(Seven)

    CheckBox:new("Eight")
    Eight.position = { (2 - 1) * pieceSize,
                    (3 - 1) * pieceSize}
    giveTheme(Eight)
    
    CheckBox:new("Nine")
    Nine.position = { (3 - 1) * pieceSize,
                    (3- 1) * pieceSize}
    giveTheme(Nine)

   


end

function shop_update(Time)
    GUIUpdate(Time)
    if insideBox(love.mouse.getX(), love.mouse.getY(), back.x, back.y, back.width, back.height ) then
        gamestate = "title"
    end 
end

function shop_draw()
    
    GUIDraw()

    love.graphics.draw(back.img, back.x, back.y, 0, resMod, resMod)
   
end

function insideBox( px, py, x, y, wx, wy )
    if px > x and px < x + wx then
        if py > y and py < y + wy then
            return true
        end
    end
    return false
end