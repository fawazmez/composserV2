-----------------------------------------------------------------------------------------
--
-- main.Lua
--
-- This file animates a charact using a spritesheet
--
--
-- Created by: Fawaz Mezher
-- Created on: april 2018 

-----------------------------------------------------------------------------------------



display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5


local playerBullets = {} -- Table that holds the players Bullets



local dPad = display.newImage( "./assets/sprites/dpad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.alpha = 0.50
dPad.id = "d-pad"



local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 200
rightArrow.id = "right arrow"


local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 200
jumpButton.id = "jump button"
jumpButton.alpha = 0.5


--ninja

local sheetOptionsIdle =

{

    width = 536,

    height = 495,

    numFrames = 10

}

local ninjaBoyAttack = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyAttack.png", sheetOptionsIdle )


local sheetOptionsWalk =

{

    width = 363,

    height = 458,

    numFrames = 10

}

local ninjaBoyJumpRun = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyJumpRun.png", sheetOptionsWalk )



-- sequences table

local sequence_data = {

    -- consecutive frames sequence

    {

        name = "idle",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = ninjaBoyAttack

    },

    {

        name = "walk",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = ninjaBoyJumpRun

    }

}


local ninja = display.newSprite( ninjaBoyAttack, sequence_data )
ninja.x = centerX
ninja.y = centerY
ninja:setSequence( "idle" )
ninja:play()


function rightArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( ninja, { 

            x = 150, 

            y = 0, 

            time = 1000 

            } )

        ninja:setSequence( "walk" )

        ninja:play()

    end


    return true

end


-- rest to idle 

local function resetToIdle (event)

    if event.phase == "ended" then

        knight:setSequence("walk")

        ninja:play()

    end

end



--robot

local sheetOptionsShoot =

{

    width = 567,

    height = 556,

    numFrames = 4

}

local robotShoot = graphics.newImageSheet( "./assets/spritesheets/robotShoot.png", sheetOptionsShoot )


local sheetOptionsJump =

{

    width = 567,

    height = 556,

    numFrames = 10

}

local robotJump = graphics.newImageSheet( "./assets/spritesheets/robotJump.png", sheetOptionsJump )



-- sequences table

local sequence_data = {

    -- consecutive frames sequence

    {

        name = "shoot",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = robotShoot

    },

    {

        name = "jump",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = robotJump

    }

}


local robot = display.newSprite( robotShoot, sequence_data )
robot.x = centerX + 500
robot.y = centerY
robot:setSequence( "shoot" )
robot:play()


function jumpButton:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( robot, { 

            x = 0, 

            y = -50, 

            time = 1000 

            } )

        robot:setSequence( "jump" )

        robot:play()

    end


    return true

end


-- rest to idle 

local function resetToIdleRobot (event)

    if event.phase == "ended" then

        knight:setSequence("shoot")

        ninja:play()

    end

end



rightArrow:addEventListener( "touch", rightArrow )
ninja:addEventListener("sprite", resetToIdle)
jumpButton:addEventListener( "touch", jumpButton )
robot:addEventListener("sprite", resetToIdleRobot)

