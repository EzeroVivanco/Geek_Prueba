----------------nt-------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local usuarioText, contrasenaText, usuarioField, contrasenaField, sesionButton, errorMesage, backgroundError, eventTimer

local status = false

local function ocultar( eventTimer )
	errorMesage.text = ""
	backgroundError:setFillColor( 255/255,255/255,255/255 )
end

local function handleButtonEvent( event )
	if (event.phase == "ended") then
		local path = system.pathForFile( "BD.db", system.DocumentsDirectory )
		local db = sqlite3.open( path ) 
		for row in db:nrows("SELECT * FROM user WHERE email='"..usuarioField.text.."'".." and password='"..contrasenaField.text.."'") do
			native.setKeyboardFocus( nil )
			storyboard.gotoScene( "home" )
			status = true	
			break
		end
		if status == false then
			backgroundError = display.newRoundedRect( _X, _Y - 150, _W * 0.82, 30, 8 )
			backgroundError:setFillColor( 255/255,68/255,68/255 )
			errorMesage = display.newText("Usuario y/o Contraseña invalido",_X,_Y - 150,native.systemFont,18)
			errorMesage:setFillColor( 255/255,255/255,255/255 )
			timer.performWithDelay( 5000, ocultar )
		end
		db:close()
	end
end

function scene:enterScene( event )

	storyboard.removeScene( "inicio" )
	storyboard.removeScene( "principal" )
	
	local sceneGroup = self.view

	usuarioText = display.newText( "Correo Electrónico", 0, 0, native.systemFont, 30 )
	usuarioText.x = _X
	usuarioText.y = _Y - 150
	usuarioText:setFillColor( 0,0,0 )
	sceneGroup:insert( usuarioText )

	contrasenaText = display.newText( "Contraseña", 0, 0, native.systemFont, 30 )
	contrasenaText.x = _X
	contrasenaText.y = _Y - 65
	contrasenaText:setFillColor( 0,0,0 )
	sceneGroup:insert( contrasenaText )

	local function onUsername( event )
	    if ( "began" == event.phase ) then
	    	errorMesage.text = ""
			backgroundError:setFillColor( 255/255,255/255,255/255 )
			timer.cancel( eventTimer )
	    elseif ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( contrasenaField )
	    end
	end

	local function onPassword( event )
	    if ( "began" == event.phase ) then
	    	errorMesage.text = ""
			backgroundError:setFillColor( 255/255,255/255,255/255 )
			timer.cancel( eventTimer )
	    elseif ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( nil )
	    end
	end

	usuarioField = native.newTextField( _X, _Y - 110, 325, 50, onUsername )
	usuarioField.font = native.newFont( native.systemFont, 15 )
	usuarioField.placeholder = "usuario@ejemplo.com"
	usuarioField.inputType = "email"
	usuarioField.align = "center"
	sceneGroup:insert( usuarioField )

	contrasenaField = native.newTextField( _X, _Y - 25, 325, 50, onPassword )
	contrasenaField.font = native.newFont( native.systemFont, 15 )
	contrasenaField.inputType = "default"
	contrasenaField.isSecure = true
	contrasenaField.align = "center"
	sceneGroup:insert( contrasenaField )

	sesionButton = widget.newButton{
		x = _X,
		y = _Y + 80,
		width = 300,
		height = 100,
		fontSize = 40,
		emboss = true,
		label = " Iniciar Sesión",
		font = native.systemFont,
		labelColor = {default={255,255,255}, over={240,248,255}},
		defaultFile = "design/borderbutton.png",
		onEvent = handleButtonEvent
	}
	sceneGroup:insert( sesionButton )
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )

return scene