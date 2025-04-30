-- needed imports

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- gfx alias
local gfx <const> = playdate.graphics

-- declare player
local player = nil

local speed = 10

function setupGame()
    local playerImage = gfx.image.new("assets/png/roulette.png")
    assert( playerImage )

    playerSprite = gfx.sprite.new( playerImage )
    playerSprite:moveTo( 200, 120 )
    playerSprite:add()

    local backgroundImage = gfx.image.new("assets/png/bg.png")
    assert( backgroundImage )

    gfx.sprite.setBackgroundDrawingCallback(
        function( x, y, width, height )
            backgroundImage:draw( 0, 0 )
        end
    )
end

setupGame()

function playdate.update()
    if playdate.buttonIsPressed( playdate.kButtonUp ) then
        playerSprite:moveBy( 0, -speed )
    end
    if playdate.buttonIsPressed( playdate.kButtonRight ) then
        playerSprite:moveBy( speed, 0 )
    end
    if playdate.buttonIsPressed( playdate.kButtonDown ) then
        playerSprite:moveBy( 0, speed )
    end
    if playdate.buttonIsPressed( playdate.kButtonLeft ) then
        playerSprite:moveBy( -speed, 0 )
    end

    gfx.sprite.update()
    playdate.timer.updateTimers()

end
