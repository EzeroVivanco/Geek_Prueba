---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------
local facebook = require( "facebook" )
local json = require( "json" )
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()

local appId = "807125025972663"

-- Escenas
require("menu")
local menuScreen = menu:new()
local homeScreen = display.newGroup()

-- Variables
local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
local visible_menu = true

local usuarioText, response, userPicture, firstName, lastName, id

-- Objetos
local mask

---------------------------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------------------------

function showMenu(event)
	if event.phase == "began" then
        if visible_menu then
            visible_menu = false
            transition.to( homeScreen, { x = homeScreen.x + 400, time = 400, transition = easing.outExpo } )
            transition.to( menuScreen, { x = menuScreen.x + 400, time = 400, transition = easing.outExpo } )
            transition.to( mask, { alpha = .5, time = 400, transition = easing.outQuad } )
            menuScreen = menu:recursos(firstName, lastName, id)
        end
	end
end

function hideMenu(event)
	if event.phase == "began" then
        if not isHome then
            transition.to( homeScreen, { x = homeScreen.x - 400, time = 400, transition = easing.outExpo } )
            transition.to( menuScreen, { x = menuScreen.x - 400, time = 400, transition = easing.outExpo } )
            transition.to( mask, { alpha = 0, time = 400, transition = easing.outQuad } )
            menuScreen = menu:hideImage()
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
    local function listener( event )

    print( "event.name", event.name )  --"fbconnect"
    print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
    print( "isError: " .. tostring( event.isError ) )
    print( "didComplete: " .. tostring( event.didComplete ) )

    --"session" events cover various login/logout events
    --"request" events handle calls to various Graph API calls
    --"dialog" events are standard popup boxes that can be displayed

    local function networkListener( event )
		if event.isError then
			native.showAlert( "Network Error", "Download of profile picture failed, please check your network connection", { "OK" } )
		elseif (event.phase == "ended") then
			--native.showAlert( "Network Error", "Download successful", { "OK" } )
			--userPicture = display.newImageRect( firstName .. lastName .. id .. ".png", system.TemporaryDirectory, 80, 80 )
			--userPicture.x = _X
			--userPicture.y = _Y - 150
			--homeScreen:insert(userPicture)
		end
	end

    if ( "session" == event.type ) then
        --options are: "login", "loginFailed", "loginCancelled", or "logout"
        if ( "login" == event.phase ) then
            --code for tasks following a successful login
        end

    elseif ( "request" == event.type ) then
        if ( not event.isError ) then
            local response = json.decode( event.response )
            usuarioText = display.newText( response.name, 0, 0, native.systemFont, 30 )
			usuarioText.x = _X
			usuarioText.y = _Y 
			usuarioText:setFillColor( 0,0,0 )
			homeScreen:insert( usuarioText )
			firstName = response.first_name
			lastName = response.last_name
			id = response.id
			network.download( "http://graph.facebook.com/" .. id .. "/picture", "GET", networkListener, firstName .. lastName .. id .. ".png", system.TemporaryDirectory )
	            --process response data here
        end

    elseif ( "dialog" == event.type ) then
        print( "dialog", event.response )
        --handle dialog results here
    end
end
    facebook.login( appId, listener )

    if(event.params.phase) then
		facebook.request( "me" )
	end
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