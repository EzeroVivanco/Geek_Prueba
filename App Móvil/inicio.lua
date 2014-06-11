local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
	local function handleButtonEvent( event )
		if (event.phase == "ended") then
			--botonInicio = nil
			--botonRegistro = nil
			local currentScore = 200
			local options = { level="Level 1", score=currentScore }
			local results = composer.loadScene( "formulario", true, options )
			composer.gotoScene( "formulario", "flip", 500 )
		end
	end

	local function handleButtonEvent2( event )
		if (event.phase == "ended") then
			composer.gotoScene( "login" , "flip", 500)
		end
	end

function scene:create( event )
	local sceneGroup = self.view

	local botonInicio = widget.newButton
	{
		x = _X,
		y = _Y,
		width = 180,
		height = 50,
		label = "Iniciar sesión",
		defaultFile = "design/borderbutton.png",
		labelColor = {default={255,255,255}, over={240,248,255}},
		onEvent = handleButtonEvent2
	}
	sceneGroup:insert( botonInicio)

	

	local botonRegistro = widget.newButton
	{
		x = _X,
		y = _H - 25,
		width = 150,
		height = 50,
		label = "Registrate",
		labelColor = {default={0,0,0}, over={240,248,255}},
		fontSize = 15,
		textOnly = true,
		onEvent = handleButtonEvent
	}
	sceneGroup:insert( botonRegistro )
end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then

		composer.removeScene( "formulario" )
		composer.removeScene( "login" )
	
	end
	
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene