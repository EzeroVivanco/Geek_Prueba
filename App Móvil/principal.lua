----------------nt-------------------------------------------------------------------------
--
-- principal.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local widgetGroup = display.newGroup()
	
	display.setStatusBar( display.HiddenStatusBar )

	local fondo = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	local titleBar = display.newRect( display.contentCenterX, 0, display.contentWidth, 52 )
	titleBar:setFillColor( 25/255, 181/255, 172/255 )
	titleBar.y = display.screenOriginY + titleBar.contentHeight * 0.5
	sceneGroup:insert( titleBar )
	
	local titleText = display.newEmbossedText( "Ethernal Honeymooners", display.contentCenterX, titleBar.y, native.systemFontBold, 20 )
	sceneGroup:insert( titleText )

	local function tapMenu( event )
		local tapEvent = display.newText( "desplegando menu", display.contentCenterX, display.contentCenterY, native.systemFont, 20 )
		tapEvent:setFillColor( 0,0,0 )
		sceneGroup:insert( tapEvent )
	end

	local mainMenu = display.newRect( 23 , titleBar.y, 56, titleBar.height )
	mainMenu:setFillColor( 25/255, 220/255, 200/255 )
	sceneGroup:insert( mainMenu )

	mainMenu:addEventListener( "tap", tapMenu )

	local tabButtons = 
	{
		{
			width = (display.contentWidth/2)-2, height = 52,
			defaultFile = "design/leftButton.png",
			overFile = "design/leftButton.png",
			size = 16,
			label = "Información",
			--onPress = function() composer.gotoScene( "screen1" ); end,
			selected = true
		},
		{
			width = (display.contentWidth/2)-2, height = 52,
			defaultFile = "design/rightButton.png",
			overFile = "design/rightButton.png",
			size = 16,
			label = "Programa",
			--onPress = function() composer.gotoScene( "screen2" ); end,
		},
	}

	--Create a tab-bar and place it at the bottom of the screen
	local demoTabs = widget.newTabBar
	{
		top = display.contentHeight - 50,
		width = display.contentWidth,
		backgroundFile = "design/background.png",
		tabSelectedLeftFile = "design/background.png",
		tabSelectedMiddleFile = "design/background.png",
		tabSelectedRightFile = "design/background.png",
		tabSelectedFrameWidth = 20,
		tabSelectedFrameHeight = 52,
		buttons = tabButtons
	}
	--sceneGroup:insert( tabBar )
	
end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		composer.removeScene( "login" )
	end
	
end

function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then

	end
	
end

function scene:destroy( event )
	
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene