-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code herelocal defaultField
local composer = require( "composer" )
local widget = require( "widget")
local sqlite3 = require "sqlite3"

local scene = composer.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local campoUsuario, campoPass, campoPass2

function scene:show( event )
	composer.removeScene( "inicio" )

	local sceneGroup = self.view

	local path = system.pathForFile("BD.db", system.DocumentsDirectory)
	db = sqlite3.open( path )  

	local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]]
	print(tablesetup)
	db:exec( tablesetup )

	local registro = display.newText( "Registro", _X, _Y - 150, native.systemFont, 18 )
	registro:setFillColor(0,0,0)
	sceneGroup:insert( registro )

	local usuario = display.newText( "Correo electronico", _X, _Y - 80, native.systemFont, 18 )
	usuario:setFillColor(0,0,0)
	sceneGroup:insert( usuario )

	local password = display.newText( "Contraseña", _X, _Y, native.systemFont, 18 )
	password:setFillColor(0,0,0)
	sceneGroup:insert( password )

	local confirmacion = display.newText( "Confirma tu contraseña", _X, _Y + 80, native.systemFont, 18 )
	confirmacion:setFillColor(0,0,0)
	sceneGroup:insert( confirmacion )

	local function onUsername( event )
	    if ( "began" == event.phase ) then
	        -- This is the "keyboard appearing" event.
	        -- In some cases you may want to adjust the interface while the keyboard is open.

	    elseif ( "submitted" == event.phase ) then
	        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
	        native.setKeyboardFocus( campoPass )
	    end
	end

	local function onPassword ( event )
	    if ( "began" == event.phase ) then
	        -- This is the "keyboard appearing" event.
	        -- In some cases you may want to adjust the interface while the keyboard is open.

	    elseif ( "submitted" == event.phase ) then
	        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
	        native.setKeyboardFocus( campoPass2 )
	    end
	end

	local function onPasswordValidated( event )
	    -- Hide keyboard when the user clicks "Return" in this field
	    if ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( nil )
	    end
	end

	campoUsuario = native.newTextField( _X, _Y - 40, 250, 40, onUsername )
	campoUsuario.align = "center"
	campoUsuario.inputType = "email"
	campoUsuario.placeholder = "usuario@ejemplo.com"
	sceneGroup:insert( campoUsuario )

	campoPass = native.newTextField( _X, _Y + 40, 250, 40, onPassword )
	campoPass.align = "center"
	campoPass.isSecure = true
	sceneGroup:insert( campoPass )

	campoPass2 = native.newTextField( _X, _Y + 120, 250, 40, onPasswordValidated )
	campoPass2.isSecure = true
	campoPass2.align = "center"
	campoPass2:setTextColor( 0, 0, 0 )
	sceneGroup:insert( campoPass2 )

	local function registrar( evento )
		if ( "ended" == evento.phase) then
			db = sqlite3.open( path ) 
			local insercion = [[INSERT INTO user VALUES (']]..campoUsuario.text..[[',']]..campoPass2.text..[[');]]
			db:exec(insercion)
			db:close()
			native.setKeyboardFocus( nil )
			composer.gotoScene( "inicio")--, "flip", 500 )
		end
	end

	local botonAceptar = widget.newButton
	{
		x = display.contentCenterX,
		y = _Y + 170,
		width = 150,
		height = 50,
		defaultFile = "design/borderbutton.png",
		label = "Aceptar",
		labelColor = {default={255,255,255}, over={240,248,255}},
		onEvent = registrar
	}
	sceneGroup:insert( botonAceptar )
end

scene:addEventListener( "show", scene )
return scene

