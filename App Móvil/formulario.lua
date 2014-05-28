-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code herelocal defaultField
local composer = require( "composer" )
local widget = require( "widget")
local scene = composer.newScene()

--sasasasasasaa
--bshxahsd
function scene:create( event )
	local sceneGroup = self.view
--jdfkjsngkjfd
	local campoUsuario, campoPass, campoPass2

	local registro = display.newText( "Registro", display.contentCenterX, 70, native.systemFont, 18 )
	sceneGroup:insert( registro )

	local usuario = display.newText( "Correo electronico", display.contentCenterX, 130, native.systemFont, 18 )
	sceneGroup:insert( usuario )

	local password = display.newText( "Contraseña", display.contentCenterX, 210, native.systemFont, 18 )
	sceneGroup:insert( password )

	local confirmacion = display.newText( "Confirma tu contraseña", display.contentCenterX, 290, native.systemFont, 18 )
	sceneGroup:insert( confirmacion )

	campoUsuario = native.newTextField( display.contentCenterX, 170, 200, 30 )
	campoUsuario.inputType = "email"
	campoUsuario.placeholder = "ejemplo@mail.com"

	campoPass = native.newTextField( display.contentCenterX, 250, 200, 30 )
	campoPass.isSecure = true

	campoPass2 = native.newTextField( display.contentCenterX, 330, 200, 30 )
	campoPass2.isSecure = true

	sceneGroup:insert( campoUsuario )
	sceneGroup:insert( campoPass )
	sceneGroup:insert( campoPass2 )
	local botonAceptar = widget.newButton
	{
		left = 100,
		top = 350,
		width = 120,
		height = 50,
		defaultFile = "button.png",
		label = "Aceptar",
		labelColor = {default={255,255,255}, over={240,248,255}}
	}
	sceneGroup:insert( botonAceptar )
end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		composer.removeScene( "scene1" )
	end
	
end

scene:addEventListener( "create", scene)
scene:addEventListener( "show", scene )

return scene

