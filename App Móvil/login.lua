----------------nt-------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"

local scene = composer.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local usuarioText, contrasenaText, usuarioField, contrasenaField, sesionButton 

local function handleButtonEvent( event )
	if (event.phase == "ended") then
		local path = system.pathForFile( "BD.db", system.DocumentsDirectory )
		local db = sqlite3.open( path ) 

		if(db:exec("SELECT * FROM user WHERE email='"..usuarioField.text.."'".." and password='"..contrasenaField.text.."'")) then
				local acceso = display.newText( "conexion exitosa", _X, 10, native.systemFont, 15 )
				acceso:setFillColor( 0,0,0 )
				composer.gotoScene( "principal", "crossFade", 500 )
		else
			local acceso = display.newText( "usuario y/o contrasñea invalido", _X, 10, native.systemFont, 15 )
			acceso:setFillColor( 0,0,0 )
		end
		db:close( )
	end
end

SesionBotonPress = function ( event )
	--composer.gotoScene("validacionDatos.lua", {params = { user = usuarioField.text, pass = contrasenaField.text} })
	if ( "ended" == event.phase) then
		local path = system.pathForFile( "BD.db", system.DocumentsDirectory )
		local db = sqlite3.open( path ) 

		for row in db:nrows("SELECT * FROM user WHERE email='"..usuarioField.text.."'") do
			if(row.email == usuarioField.text and row.password == contrasenaField.text) then
				local acceso = display.newText( "conexion exitosa", _X, 10, native.systemFont, 15 )
				acceso:setFillColor( 0,0,0 )
				composer.gotoScene( "principal" )
			else
				local acceso = display.newText( "usuario y/o contrasñea invalido", _X, 10, native.systemFont, 15 )
				acceso:setFillColor( 0,0,0 )
			end
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
	usuarioField.align = "center"
	sceneGroup:insert( usuarioField )

	contrasenaField = native.newTextField( 160, _Y - 25, 275, 50 )
	contrasenaField.font = native.newFont( native.systemFont, 15 )
	contrasenaField.inputType = "default"
	contrasenaField.isSecure = true
	contrasenaField.align = "center"
	sceneGroup:insert( contrasenaField )

	sesionButton = widget.newButton{
		x = _X,
		y = _Y + 30,
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
		composer.removeScene( "inicio" )
		composer.removeScene( "principal" )
	end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene