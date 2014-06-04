----------------nt-------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )
local usuarioText, contrasenaText, usuarioField, contrasenaField, sesionButton, sesionButtonPress 
local scene = composer.newScene()

local function handleButtonEvent( event )
		if (event.phase == "ended") then
			sesionButton = nil
			usuarioText = nil
			usuarioField = nil
			contrasenaField = nil
			contrasenaText = nil
			composer.gotoScene( "principal" )
		end
	end

function scene:create( event )
	local sceneGroup = self.view

	local fondo = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	usuarioText = display.newText( "Correo Electrónico", 0, 0, native.systemFont, 15 )
	usuarioText = display.newText( "Nombre de Usuario o Correo Electrónico", 0, 0, native.systemFont, 15 )
	usuarioText.x = display.contentCenterX
	usuarioText.y = display.contentCenterY - 150
	usuarioText:setFillColor( 0,0,0 )
	sceneGroup:insert( usuarioText )

	contrasenaText = display.newText( "Contraseña", 0, 0, native.systemFont, 15 )
	contrasenaText.x = display.contentCenterX
	contrasenaText.y = display.contentCenterY - 65
	contrasenaText:setFillColor( 0,0,0 )
	sceneGroup:insert( contrasenaText )

	usuarioField = native.newTextField( 160, display.contentCenterY - 110, 275, 50 )
	usuarioField.font = native.newFont( native.systemFont, 15 )
	usuarioField.placeholder = "usuario@ejemplo.com"
	usuarioField.inputType = "email"
	usuarioField.isVisible = false 
	sceneGroup:insert( usuarioField )

	contrasenaField = native.newTextField( 160, display.contentCenterY - 25, 275, 50 )
	contrasenaField.font = native.newFont( native.systemFont, 15 )
	contrasenaField.inputType = "default"
	contrasenaField.isSecure = true
	contrasenaField.isVisible = false 
	sceneGroup:insert( contrasenaField )

	sesionButton = widget.newButton{
		x = display.contentCenterX,
		y = display.contentCenterY + 30,
		left = 100,
		top = 350,
		width = 150,
		height = 50,
		fontSize = 20,
		emboss = true,
		label = " Iniciar Sesión",
		font = native.systemFont,
		labelColor = {default={255,255,255}, over={240,248,255}},
		defaultFile = "design/borderbutton.png",
		onEvent = handleButtonEvent
	}
	sceneGroup:insert( sesionButton )
end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		composer.removeScene( "main" )
	end
	
end

function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then

		sesionButton = nil
	end
	
end

function scene:destroy( event )
	
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene