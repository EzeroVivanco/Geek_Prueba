---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUERIMIENTOS Y VARIABLES
---------------------------------------------------------------------------------
local facebook = require( "facebook" )
local json = require( "json" )
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()

local appId = "807125025972663"

-- Escenas
require("code.menu")
local menuScreen
local homeScreen = display.newGroup()

-- Variables
local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
local visible_menu = true


-- Objetos
local mask

---------------------------------------------------------------------------------
-- OYENTES
---------------------------------------------------------------------------------

--Evento para mostrar el menú lateral.
function showMenu(event)
	if event.phase == "began" then
        if visible_menu then
            visible_menu = false
            transition.to( homeScreen, { x = homeScreen.x + 400, time = 400, transition = easing.outExpo } )
            transition.to( menuScreen, { x = menuScreen.x + 400, time = 400, transition = easing.outExpo } )
            transition.to( mask, { alpha = .5, time = 400, transition = easing.outQuad } )
        end
	end
end

--Evento para ocultar el menú lateral.
function hideMenu(event)
	if event.phase == "began" then
        if not isHome then
            transition.to( homeScreen, { x = homeScreen.x - 400, time = 400, transition = easing.outExpo } )
            transition.to( menuScreen, { x = menuScreen.x - 400, time = 400, transition = easing.outExpo } )
            transition.to( mask, { alpha = 0, time = 400, transition = easing.outQuad } )
            timer.performWithDelay( 500, function()
                visible_menu = true
            end, 1 )
        end
	end
end

---------------------------------------------------------------------------------
-- OVERRIDING SCENES METHODS
---------------------------------------------------------------------------------

function scene:createScene( event )
	local screenGroup = self.view
    screenGroup:insert(homeScreen)
    menuScreen = menu:new(event.params.phase)
    
    --Creación de Objetos.
    local topBar = display.newRect( display.contentCenterX, 0, display.contentWidth, 60 )
    topBar.y = display.screenOriginY + topBar.contentHeight * 0.5
	topBar:setFillColor( 25/255, 181/255, 172/255 )
	homeScreen:insert(topBar)

	local topText = display.newText{
		text = "   Etternal Honeymooners",    
		width = topBar.width,
    	x = topBar.x,
    	y = topBar.y,
    	font = native.systemFontBold,   
    	fontSize = 30,
    	align = "center" 
	}
	topText:setFillColor( 192, 192, 192 )
	homeScreen:insert(topText)

    --Creación del botón que manipula el menú lateral.
	local buttonMenu = display.newRect( display.screenOriginX + 30 , display.screenOriginY + 30, 60, 60 )
	buttonMenu:setFillColor( 25/255, 181/255, 172/255 )
	buttonMenu:addEventListener( "touch", showMenu )
	homeScreen:insert(buttonMenu)
	
	local menuText = display.newText{
		text = "|||",    
		width = buttonMenu.width,
    	x = buttonMenu.x,
    	y = buttonMenu.y,
    	font = native.systemFontBold,   
    	fontSize = 35,
    	align = "center" 
	}
	menuText:setFillColor( 192, 192, 192 )
	homeScreen:insert(menuText)

    --Submenú inferior.
	local leftTabBar = display.newRect(_W/4, _H-25, _W/2 - 0.5, 50)
	leftTabBar:setFillColor( 25/255, 181/255, 172/255 )
	homeScreen:insert( leftTabBar )

	local leftText = display.newText{
		text = "Información",    
		width = leftTabBar.width,
    	x = leftTabBar.x,
    	y = leftTabBar.y,
    	font = native.systemFontBold,   
    	fontSize = 25,
    	align = "center" 
	}
	menuText:setFillColor( 192, 192, 192 )
	homeScreen:insert(leftText)

	local rightTabBar = display.newRect((_W/4) * 3 + 1, _H-25, _W/2, 50)
	rightTabBar:setFillColor( 25/255, 181/255, 172/255 )
	homeScreen:insert( rightTabBar )

	local rightText = display.newText{
		text = "Programa",    
		width = rightTabBar.width,
    	x = rightTabBar.x,
    	y = rightTabBar.y,
    	font = native.systemFontBold,   
    	fontSize = 25,
    	align = "center" 
	}
	menuText:setFillColor( 192, 192, 192 )
	homeScreen:insert(rightText)

	-- Creamos la mascara
    mask = display.newRect( display.contentCenterX, display.contentCenterY, _W, _H )
    mask:setFillColor( 0, 0, 0)
    mask.alpha = 0
    homeScreen:insert(mask)
    mask:addEventListener( "touch", hideMenu )

    --Creamos la pantalla del Menu
    menuScreen:builScreen()

end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener("createScene", scene )
scene:addEventListener("enterScene", scene )
scene:addEventListener("exitScene", scene )

return scene