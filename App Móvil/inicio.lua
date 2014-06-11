local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
	local function handleButtonEvent( event )
		if (event.phase == "ended") then
			botonInicio = nil
			botonRegistro = nil
			composer.gotoScene( "formulario" )
		end
	end

	local function handleButtonEvent2( event )
		if (event.phase == "ended") then
			botonInicio = nil
			botonRegistro = nil
			composer.gotoScene( "principal" )
		end
	end

function scene:create( event )
	local sceneGroup = self.view

	local fondo = display.newRect( _X, _Y, _W, _H )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

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
		y = _H,
		width = 150,
		height = 50,
		label = "Registrate",
		--defaultFile = "design/borderbutton.png",
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
	
		print( "regresando a inicio" )
	
		-- remove previous scene's view
		composer.removeScene( "formulario" )
		composer.removeScene( "login" )
	
	end
	
end

function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then
	
		print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		--botonRegistro:removeEventListener( "handleButtonEvent", botonRegistro )
		--botonInicio:removeEventListener( "handleButtonEvent2", botonInicio )
	
	end
	
end

function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end


scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "show", scene )

return scene