---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local widget = require( "widget")
local sqlite3 = require "sqlite3"
local dbMethods = require( "code.ConnectionDB" )
local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local fieldUser, fieldPass, fieldPass2

---------------------------------------------------------------------------------
-- OYENTES
---------------------------------------------------------------------------------

--Evento para cambiar al campo de contraseña al presionar Enter.
local function onUsername( event )
    if ( "began" == event.phase ) then
        -- Evento de aparicion del teclado.
    elseif ( "submitted" == event.phase ) then
        -- Automaticamente tabula al campo de contraseña si el usuario presiona "Return" en el teclado virtual.
        native.setKeyboardFocus( campoPass )
    end
end

--Evento para confirmar el Password al presionar Enter.
local function onPassword ( event )
    if ( "began" == event.phase ) then
        -- Evento de aparicion del teclado.
    elseif ( "submitted" == event.phase ) then
        -- Automaticamente tabula al campo de contraseña si el usuario presiona "Return" en el teclado virtual.
        native.setKeyboardFocus( campoPass2 )
    end
end

--Evento para ocultar el teclado al presionar Enter.
local function onPasswordValidated( event )
    -- Oculta el teclado cuando el usuario presiona "Return" en este campo.
    if ( "submitted" == event.phase ) then
        native.setKeyboardFocus( nil )
    end
end

---------------------------------------------------------------------------------
-- METODOS DE ESCENAS
---------------------------------------------------------------------------------

function scene:enterScene( event )

	storyboard.removeScene( "code.welcome" )
	
	local sceneGroup = self.view
	
	--Abre la conexión a base de datos.
	--local path = system.pathForFile("BD.db", system.DocumentsDirectory)
	--db = sqlite3.open( path )
	
	--Creación de Objetos.
	local register = display.newText( "Registro", _X, _Y - 200, native.systemFont, 35 )
	register:setFillColor(0,0,0)
	sceneGroup:insert( register )
	
	local user = display.newText( "Correo electronico", _X, _Y - 130, native.systemFont, 30 )
	user:setFillColor(0,0,0)
	sceneGroup:insert( user )
	
	local password = display.newText( "Contraseña", _X, _Y - 40, native.systemFont, 30 )
	password:setFillColor(0,0,0)
	sceneGroup:insert( password )
	
	local confirmation = display.newText( "Confirma tu contraseña", _X, _Y + 50, native.systemFont, 30 )
	confirmation:setFillColor(0,0,0)
	sceneGroup:insert( confirmation )

	fieldUser = native.newTextField( _X, _Y - 90, 320, 50, onUsername )
	fieldUser.align = "center"
	fieldUser.inputType = "email"
	fieldUser.placeholder = "usuario@ejemplo.com"
	sceneGroup:insert( fieldUser )

	fieldPass = native.newTextField( _X, _Y, 320, 50, onPassword )
	fieldPass.align = "center"
	fieldPass.isSecure = true
	sceneGroup:insert( fieldPass )

	fieldPass2 = native.newTextField( _X, _Y + 90, 320, 50, onPasswordValidated )
	fieldPass2.isSecure = true
	fieldPass2.align = "center"
	fieldPass2:setTextColor( 0, 0, 0 )
	sceneGroup:insert( fieldPass2 )

	--Validación de Campos y registro de base de datos.
	local function registration( event )
		if ( "ended" == event.phase) then
			if(fieldUser.text == "" or fieldPass.text == "" or fieldPass2.text == "")then
			
			elseif (fieldPass.text ~= fieldPass2.text) then

			else
				--db = sqlite3.open( path )
				dbMethods.InsertUser(fieldUser.text,fieldPass2.text)
				--local insertion = [[INSERT INTO user VALUES (']]..fieldUser.text..[[',']]..fieldPass2.text..[[');]]
				--db:exec(insertion)
				--db:close()
				dbMethods.CloseDB()
				native.setKeyboardFocus( nil )
				storyboard.gotoScene( "code.welcome")
			end
		end
	end

	local acceptButton = widget.newButton
	{
		x = display.contentCenterX,
		y = _Y + 170,
		width = 250,
		height = 70,
		defaultFile = "design/borderbutton.png",
		label = "Aceptar",
		fontSize = 40,
		labelColor = {default={255,255,255}, over={240,248,255}},
		onEvent = registration
	}
	sceneGroup:insert( acceptButton )
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )
return scene