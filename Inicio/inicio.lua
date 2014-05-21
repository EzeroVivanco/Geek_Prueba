

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

	local function handleButtonEvent( event )
		if (event.phase == "ended") then
			composer.gotoScene( "formulario" , {effect = "flip", time = 1000} )
		end
	end


function scene:create( event )
	local sceneGroup = self.view
	local botonInicio = widget.newButton
	{
		x = display.contentCenterX,
		y = display.contentCenterY,
		width = 120,
		height = 50,
		label = "Iniciar sesión",
	}
	sceneGroup:insert( botonInicio)

	

	local botonRegistro = widget.newButton
	{
		x = display.contentCenterX,
		y = display.contentCenterY + 50,
		width = 120,
		height = 50,
		label = "Regristrate",
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
	
	end
	
end

function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end


scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene