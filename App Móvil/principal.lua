----------------nt-------------------------------------------------------------------------
--
-- principal.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local beginX 
local beginY  
local endX  
local endY 
 
local xDistance  
local yDistance
 
local bDoingTouch
local minSwipeDistance = 50
local totalSwipeDistanceLeft
local totalSwipeDistanceRight
local totalSwipeDistanceUp
local totalSwipeDistanceDown

local statusMenu = false

function widget.newPanel( options )
    local customOptions = options or {}
    local opt = {}
    opt.location = customOptions.location or "top"
    local default_width, default_height

    if ( opt.location == "top" or opt.location == "bottom" ) then
        default_width = display.contentWidth
        default_height = display.contentHeight * 0.33
    else
        default_width = display.contentWidth * 0.33
        default_height = display.contentHeight
    end
    
    opt.width = customOptions.width or default_width
    opt.height = customOptions.height or default_height
    opt.speed = customOptions.speed or 500
    opt.inEasing = customOptions.inEasing or easing.linear
    opt.outEasing = customOptions.outEasing or easing.linear

    if ( customOptions.onComplete and type(customOptions.onComplete) == "function" ) then
        opt.listener = customOptions.onComplete
    else 
        opt.listener = nil
    end
    
    local container = display.newContainer( opt.width, opt.height )
    
    if ( opt.location == "left" ) then
        container.anchorX = 1.0
        container.x = display.screenOriginX
        container.anchorY = 0.5
        container.y = display.contentCenterY
    end
    
    function container:show()
        local options = {
            time = opt.speed,
            transition = opt.inEasing
        }
        
        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "shown"
        end
        
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY + opt.height
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight - opt.height
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX + opt.width
        else
            options.x = display.actualContentWidth - opt.width
        end 
        
        transition.to( self, options )
    end

    function container:hide()
        local options = {
            time = opt.speed,
            transition = opt.outEasing
        }

        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "hidden"
        end
        
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX
        else
            options.x = display.actualContentWidth
        end 
        
        transition.to( self, options )
    end
    return container
end

local panel= widget.newPanel{
    location = "left",
    onComplete = panelTransDone,
    width = display.contentWidth * 0.6,
    height = display.contentHeight-80,
    speed = 250,
    inEasing = easing.linear,
    outEasing = easing.linear,
}

panel.background = display.newRect( 0, 0, panel.width, panel.height )
panel.background:setFillColor( 28/255, 28/255, 28/255 )
panel:insert( panel.background )

panel.title = display.newText( "Texto del Menú", 0, 0 - 170, native.systemFontBold, 18 )
panel.title:setFillColor( 1, 1, 1 )
panel:insert( panel.title )

function checkSwipeDirection()
    if bDoingTouch == true then
        xDistance =  math.abs(endX - beginX)
        yDistance =  math.abs(endY - beginY)

        if xDistance > yDistance then
            if beginX > endX then
                totalSwipeDistanceLeft = beginX - endX
                if totalSwipeDistanceLeft > minSwipeDistance then
                    if(statusMenu) then
                        panel:hide()
                        statusMenu = false
                        print( statusMenu )
                        print("Swiped Left")
                    end
                end
            else 
                totalSwipeDistanceRight = endX - beginX
                if totalSwipeDistanceRight > minSwipeDistance then
                    if(statusMenu == false) then
                        panel:show()
                        statusMenu = true
                        print( statusMenu )
                        print("Swiped Right")
                    end
                end
            end
        end
    end
end

 function swipe(event)
    if event.phase == "began" then
        bDoingTouch = true
        beginX = event.x
        beginY = event.y
    end
    if event.phase == "ended"  then
        endX = event.x
        endY = event.y
        checkSwipeDirection();
        bDoingTouch = false
    end
end

function scene:show( event )
	composer.removeScene( "login" )
	local sceneGroup = self.view
	local widgetGroup = display.newGroup()
	
	display.setStatusBar( display.HiddenStatusBar )

	local function tapMenu( event )
		if(statusMenu) then
			panel:hide()
			statusMenu = false
		else
			panel:show()
			statusMenu = true
		end
		return true
	end

	local mainMenu = display.newRect( display.screenOriginX + 20 , display.screenOriginY+20, 40, 40 )
	mainMenu:setFillColor( 25/255, 181/255, 172/255 )
	mainMenu:addEventListener( "tap", tapMenu )
	sceneGroup:insert( mainMenu )

	local topBar = display.newRect( display.contentCenterX , display.screenOriginY+20, display.contentWidth, 40 )
	topBar:setFillColor( 25/255, 181/255, 172/255 )
	sceneGroup:insert( topBar )

	local leftTabBar = display.newRect(_W/4,_H-20,_W/2 - 0.5,40)
	leftTabBar:setFillColor( 25/255, 181/255, 172/255 )
	sceneGroup:insert( leftTabBar )

	local rightTabBar = display.newRect((_W/4)*3 + 0.5,_H-20,_W/2 - 0.5,40)
	rightTabBar:setFillColor( 25/255, 181/255, 172/255 )
	sceneGroup:insert( rightTabBar )

	local infoText = display.newText{
	text = "  Etternal Honeymooners",    
	width = topBar.width,
    x = topBar.x,
    y = topBar.y,
    font = native.systemFontBold,   
    fontSize = 18,
    align = "center" 
	}
	infoText:setFillColor( 192, 192, 192 )
	sceneGroup:insert( topBar )

	local infoText = display.newText{
	text = "|||",    
	width = mainMenu.width,
    x = mainMenu.x,
    y = mainMenu.y,
    font = native.systemFontBold,   
    fontSize = 18,
    align = "center" 
	}
	infoText:setFillColor( 192, 192, 192 )
	sceneGroup:insert( mainMenu )

	local infoText = display.newText{
	text = "  Información",    
	width = leftTabBar.width,
    x = leftTabBar.x,
    y = leftTabBar.y,
    font = native.systemFontBold,   
    fontSize = 18,
    align = "center" 
	}
	infoText:setFillColor( 192, 192, 192 )
	sceneGroup:insert( infoText )

	local programaText = display.newText{
	text = "Programa",    
	width = leftTabBar.width,
    x = rightTabBar.x,
    y = rightTabBar.y,
    font = native.systemFontBold,   
    fontSize = 18,
    align= "center"
	}
	infoText:setFillColor( 192, 192, 192 )
	sceneGroup:insert( programaText )
end

Runtime:addEventListener("touch", swipe)
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene