----------------nt-------------------------------------------------------------------------
--
-- principal.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

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

function scene:create( event )
	local sceneGroup = self.view
	local widgetGroup = display.newGroup()
	
	display.setStatusBar( display.HiddenStatusBar )

	local fondo = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	--local titleBar = display.newRect( display.contentCenterX, 0, display.contentWidth, 52 )
	--titleBar:setFillColor( 25/255, 181/255, 172/255 )
	--titleBar.y = display.screenOriginY + titleBar.contentHeight * 0.5
	--sceneGroup:insert( titleBar )
	
	--local titleText = display.newEmbossedText( "Ethernal Honeymooners", display.contentCenterX, titleBar.y, native.systemFontBold, 20 )
	--sceneGroup:insert( titleText )

	local panel = widget.newPanel{
		location = "left",
		onComplete = panelTransDone,
		width = display.contentWidth * 0.8,
		height = display.contentHeight,
		speed = 250,
		inEasing = easing.linear,
		outEasing = easing.linear,
	}

	panel.background = display.newRect( 0, 0, panel.width, panel.height )
	panel.background:setFillColor( 28/255, 28/255, 28/255 )
	panel:insert( panel.background )

	panel.title = display.newText( "Texto del Menú", 0, 0, native.systemFontBold, 18 )
	panel.title:setFillColor( 1, 1, 1 )
	panel:insert( panel.title )

	local function tapMenu( event )
		panel:show()
	end

	local mainMenu = display.newRect( 0 , 26, 56, 52 )
	mainMenu:setFillColor( 25/255, 220/255, 200/255 )
	mainMenu:addEventListener( "tap", tapMenu )
	sceneGroup:insert( mainMenu )

	local tabButtons = 
	{
		{
			width = 40, height = 10,
			defaultFile = "design/unchecked.png",
			overFile = "design/checked.png",
			size = 16,
			label = "Información",
			--onPress = function() composer.gotoScene( "screen1" ); end,
			selected = true
		},
		{
			width = 40, height = 10,
			defaultFile = "design/unchecked.png",
			overFile = "design/checked.png",
			size = 16,
			label = "Programa",
			--onPress = function() composer.gotoScene( "screen2" ); end,
		},
	}

	--Create a tab-bar and place it at the bottom of the screen
	local demoTabs = widget.newTabBar
	{
		top = display.contentHeight,
		width = display.contentWidth,
		backgroundFile = "design/background.png",
		tabSelectedLeftFile = "design/background4.png",
		tabSelectedMiddleFile = "design/background4.png",
		tabSelectedRightFile = "design/background4.png",
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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene