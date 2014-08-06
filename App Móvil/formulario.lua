---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local widget = require( "widget")
local sqlite3 = require "sqlite3"

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local campoUsuario, campoPass, campoPass2

---------------------------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------------------------

--Evento para cambiar al campo de Password al presionar Enter.
local function onUsername( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( campoPass )
    end
end

--Evento para confirmar el Password al presionar Enter.
local function onPassword ( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( campoPass2 )
    end
end

--Evento para ocultar el teclado al presionar Enter.
local function onPasswordValidated( event )
    -- Hide keyboard when the user clicks "Return" in this field.
    if ( "submitted" == event.phase ) then
        native.setKeyboardFocus( nil )
    end
end

---------------------------------------------------------------------------------
-- OVERRIDING SCENES METHODS
---------------------------------------------------------------------------------

function scene:enterScene( event )

	storyboard.removeScene( "inicio" )
	
	local sceneGroup = self.view
	
	--Abre la conexión a base de datos.
	local path = system.pathForFile("BD.db", system.DocumentsDirectory)
	db = sqlite3.open( path )
	
	--Creación de Objetos.
	local registro = display.newText( "Registro", _X, _Y - 200, native.systemFont, 35 )
	registro:setFillColor(0,0,0)
	sceneGroup:insert( registro )
	
	local usuario = display.newText( "Correo electronico", _X, _Y - 130, native.systemFont, 30 )
	usuario:setFillColor(0,0,0)
	sceneGroup:insert( usuario )
	
	local password = display.newText( "Contraseña", _X, _Y - 40, native.systemFont, 30 )
	password:setFillColor(0,0,0)
	sceneGroup:insert( password )
	
	local confirmacion = display.newText( "Confirma tu contraseña", _X, _Y + 50, native.systemFont, 30 )
	confirmacion:setFillColor(0,0,0)
	sceneGroup:insert( confirmacion )

	campoUsuario = native.newTextField( _X, _Y - 90, 320, 50, onUsername )
	campoUsuario.align = "center"
	campoUsuario.inputType = "email"
	campoUsuario.placeholder = "usuario@ejemplo.com"
	sceneGroup:insert( campoUsuario )

	campoPass = native.newTextField( _X, _Y, 320, 50, onPassword )
	campoPass.align = "center"
	campoPass.isSecure = true
	sceneGroup:insert( campoPass )

	campoPass2 = native.newTextField( _X, _Y + 90, 320, 50, onPasswordValidated )
	campoPass2.isSecure = true
	campoPass2.align = "center"
	campoPass2:setTextColor( 0, 0, 0 )
	sceneGroup:insert( campoPass2 )

	--Validación de Campos y registro de base de datos.
	local function registrar( evento )
		if ( "ended" == evento.phase) then
			if(campoUsuario.text == "" or campoPass.text == "" or campoPass2.text == "")then
			
			elseif (campoPass.text ~= campoPass2.text) then

			else
				db = sqlite3.open( path )
				local insercion = [[INSERT INTO user VALUES (']]..campoUsuario.text..[[',']]..campoPass2.text..[[');]]
				db:exec(insercion)
				db:close()
				native.setKeyboardFocus( nil )
				storyboard.gotoScene( "inicio")
			end
		end
	end

	local botonAceptar = widget.newButton
	{
		x = display.contentCenterX,
		y = _Y + 170,
		width = 250,
		height = 70,
		defaultFile = "design/borderbutton.png",
		label = "Aceptar",
		fontSize = 40,
		labelColor = {default={255,255,255}, over={240,248,255}},
		onEvent = registrar
	}
	sceneGroup:insert( botonAceptar )
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )
return scene