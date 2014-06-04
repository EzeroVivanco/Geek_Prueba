

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

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
			composer.gotoScene( "login" )
		end
	end

function scene:create( event )
	local sceneGroup = self.view

	local fondo = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	local botonInicio = widget.newButton
	{
		x = display.contentCenterX,
		y = display.contentCenterY,
		width = 120,
		height = 50,
		label = "Iniciar sesión",
		onEvent = handleButtonEvent2
	}
	sceneGroup:insert( botonInicio)

	

	local botonRegistro = widget.newButton
	{
		x = display.contentCenterX,
		y = display.contentCenterY + 50,
		width = 120,
		height = 50,
		label = "Registrate",
		fontSize = 15,
		onEvent = handleButtonEvent
	}
	sceneGroup:insert( botonRegistro )
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

return scene