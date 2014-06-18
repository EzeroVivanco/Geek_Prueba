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

local status = false

local function handleButtonEvent( event )
	if (event.phase == "ended") then
		local path = system.pathForFile( "BD.db", system.DocumentsDirectory )
		local db = sqlite3.open( path ) 
		for row in db:nrows("SELECT * FROM user WHERE email='"..usuarioField.text.."'".." and password='"..contrasenaField.text.."'") do
			native.setKeyboardFocus( nil )
			composer.gotoScene( "principal" )
			status = true	
			break
		end
		if (status == false) then
			--composer.showOverlay( "popup" )
		end
		db:close()
	end
end

function scene:show( event )

	composer.removeScene( "inicio" )
	composer.removeScene( "principal" )
	
	local sceneGroup = self.view
	
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

	local function onUsername( event )
	    if ( "began" == event.phase ) then
	        -- This is the "keyboard appearing" event.
	        -- In some cases you may want to adjust the interface while the keyboard is open.

	    elseif ( "submitted" == event.phase ) then
	        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
	        native.setKeyboardFocus( contrasenaField )
	    end
	end

	local function onPassword( event )
	    -- Hide keyboard when the user clicks "Return" in this field
	    if ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( nil )
	    end
	end

	usuarioField = native.newTextField( 160, _Y - 110, 275, 50, onUsername )
	usuarioField.font = native.newFont( native.systemFont, 15 )
	usuarioField.placeholder = "usuario@ejemplo.com"
	usuarioField.inputType = "email"
	usuarioField.align = "center"
	sceneGroup:insert( usuarioField )

	contrasenaField = native.newTextField( 160, _Y - 25, 275, 50, onPassword )
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

scene:addEventListener( "show", scene )

return scene