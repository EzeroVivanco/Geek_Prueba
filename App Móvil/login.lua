----------------nt-------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )
require "sqlite3"
local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
local usuarioText, contrasenaText, usuarioField, contrasenaField, sesionButton, sesionButtonPress 
local scene = composer.newScene()

SesionBotonPress = function ( event )
	--composer.gotoScene("validacionDatos.lua", {params = { user = usuarioField.text, pass = contrasenaField.text} })
	if ( "ended" == event.phase) then
		local path = system.pathForFile( "BD.db", system.DocumentsDirectory )
		local db = sqlite3.open( path )

		local people = {} -- starts off emtpy

		for row in db:nrows("SELECT * FROM user") do
			print( "Row " .. row.email )

			-- create table at next available array index
			people[#people+1] =
			{
				name = row.email,
				pass = row.password
			}
		end

		db:close( )
	end
end

function scene:create( event )
	local sceneGroup = self.view

	local fondo = display.newRect( _X, _Y, _W, _H )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	usuarioText = display.newText( "Correo Electrónico", 0, 0, native.systemFont, 15 )
	usuarioText = display.newText( "Nombre de Usuario o Correo Electrónico", 0, 0, native.systemFont, 15 )
	usuarioText.x = _X
	usuarioText.y = _Y - 150
	usuarioText:setFillColor( 0,0,0 )
	sceneGroup:insert( usuarioText )

	contrasenaText = display.newText( "Contraseña", 0, 0, native.systemFont, 15 )
	contrasenaText.x = _X
	contrasenaText.y = _Y - 65
	contrasenaText:setFillColor( 0,0,0 )
	sceneGroup:insert( contrasenaText )

	usuarioField = native.newTextField( 160, _Y - 110, 275, 50 )
	usuarioField.font = native.newFont( native.systemFont, 15 )
	usuarioField.placeholder = "usuario@ejemplo.com"
	usuarioField.inputType = "email"
	usuarioField.isVisible = false 
	sceneGroup:insert( usuarioField )

	contrasenaField = native.newTextField( 160, _Y - 25, 275, 50 )
	contrasenaField.font = native.newFont( native.systemFont, 15 )
	contrasenaField.inputType = "default"
	contrasenaField.isSecure = true
	contrasenaField.isVisible = false 
	sceneGroup:insert( contrasenaField )

	sesionButton = widget.newButton{
<<<<<<< HEAD
		x = _X,
		y = _Y + 30,
		label = "Iniciar Sesión",
		font = native.systemFont,
=======
		x = display.contentCenterX,
		y = display.contentCenterY + 30,
		left = 100,
		top = 350,
		width = 150,
		height = 50,
>>>>>>> 73e0c05bd5cbcf122d8742a523fea8c3020a616c
		fontSize = 20,
		emboss = true,
		label = " Iniciar Sesión",
		font = native.systemFont,
		labelColor = {default={255,255,255}, over={240,248,255}},
		defaultFile = "design/borderbutton.png",
		onEvent = SesionBotonPress
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