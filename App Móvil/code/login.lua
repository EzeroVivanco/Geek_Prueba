---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- LIBRERIAS Y VARIABLES
---------------------------------------------------------------------------------

local facebook = require( "facebook" )
local json = require( "json" )
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"
local dbMethods = require( "code.ConnectionDB")

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local appId = "807125025972663"							-- Facebook App ID string
local fbCommand = nil
local GET_USER_INFO = "getInfo"

local userText, passText, userField, passField, sessionButton, errorMessage, backgroundError, eventTimer
local status = false

---------------------------------------------------------------------------------
-- FUNCIONES
---------------------------------------------------------------------------------

--Validación del ID de la aplicación.
if not appId then
	local function onComplete( event )
		if event.index == 1 then
			system.openURL( "http://developers.facebook.com/docs/guides/canvas/" )
		end
	end
	native.showAlert( "Error", "To develop for Facebook Connect, you need to get an API key and application secret. This is available from Facebook's website.",
		{ "Learn More", "Cancel" }, onComplete )
end

---------------------------------------------------------------------------------
-- OYENTES
---------------------------------------------------------------------------------

--Oculta el mensaje de error.
local function ocultar( eventTimer )
	if errorMessage.isVisible then
		errorMessage.text = ""
		errorMessage.isVisible = false
		backgroundError:setFillColor( 255/255,255/255,255/255 )
		backgroundError.isVisible = false
	end
end

--Obtiene y valida los datos del usuario ingresado desde la base de datos.
local function handleButtonEvent( event )
	if (event.phase == "ended") then
		dbMethods.CreateConection()
		if(dbMethods.SearchUser(userField.text,passField.text)) then
			local options =
			{
			    params =
			    {
			        phase = false
			    }
			}
			if errorMesage.isVisible then
				errorMesage.isVisible = false
				backgroundError.isVisible = false
            end
			storyboard.gotoScene( "code.home" ,options)
			status = true
		end
		if status == false then
			errorMesage.isVisible = true
			backgroundError.isVisible = true
			timer.performWithDelay( 3000, ocultar )
		end
		dbMethods.CloseDB()
	end
end

---------------------------------------------------------------------------------
-- OVERRIDING SCENES METHODS
---------------------------------------------------------------------------------

function scene:enterScene( event )

	storyboard.removeScene( "code.welcome" )
	
	local sceneGroup = self.view

	--Creación del Objeto para el mensaje de error.
	backgroundError = display.newRoundedRect( _X, _Y - 250, _W * 0.82, 30, 8 )
	backgroundError:setFillColor( 255/255,68/255,68/255 )
	errorMesage = display.newText("Usuario y/o Contraseña invalido",_X,_Y - 250,native.systemFont,18)
	errorMesage:setFillColor( 255/255,255/255,255/255 )
	errorMesage.isVisible = false
	backgroundError.isVisible = false

	--Creación de Objetos.
	userText = display.newText( "Correo Electrónico", 0, 0, native.systemFont, 30 )
	userText.x = _X
	userText.y = _Y - 150
	userText:setFillColor( 0,0,0 )
	sceneGroup:insert( userText )

	passText = display.newText( "Contraseña", 0, 0, native.systemFont, 30 )
	passText.x = _X
	passText.y = _Y - 65
	passText:setFillColor( 0,0,0 )
	sceneGroup:insert( passText )

	--Evento para cambiar al campo de Password al presionar Enter.
	local function onUsername( event )
	    if ( "began" == event.phase ) then
	    	errorMesage.text = ""
			backgroundError:setFillColor( 255/255,255/255,255/255 )
			timer.cancel( eventTimer )
	    elseif ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( contrasenaField )
	    end
	end

	--Evento para confirmar el Password al presionar Enter.
	local function onPassword( event )
	    if ( "began" == event.phase ) then
	    	errorMesage.text = ""
			backgroundError:setFillColor( 255/255,255/255,255/255 )
			timer.cancel( eventTimer )
	    elseif ( "submitted" == event.phase ) then
	        native.setKeyboardFocus( nil )
	    end
	end

	userField = native.newTextField( _X, _Y - 110, 325, 50, onUsername )
	userField.font = native.newFont( native.systemFont, 15 )
	userField.placeholder = "usuario@ejemplo.com"
	userField.inputType = "email"
	userField.align = "center"
	sceneGroup:insert( userField )

	passField = native.newTextField( _X, _Y - 25, 325, 50, onPassword )
	passField.font = native.newFont( native.systemFont, 15 )
	passField.inputType = "default"
	passField.isSecure = true
	passField.align = "center"
	sceneGroup:insert( passField )

	sessionButton = widget.newButton{
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
	sceneGroup:insert( sessionButton )

	local function listener( event )

	--Conexión a Facebook.
    print( "event.name", event.name )  
    print( "event.type:", event.type ) 
    print( "isError: " .. tostring( event.isError ) )
    print( "didComplete: " .. tostring( event.didComplete ) )

    if ( "session" == event.type ) then
        --Las opciones son: "login", "loginFailed", "loginCancelled", or "logout"
        if ( "login" == event.phase ) then
        	local options =
			{
			    params =
			    {
			        phase = event.phase
			    }
			}
			if errorMesage.isVisible then
				errorMesage.isVisible = false
				backgroundError.isVisible = false
            end
            storyboard.gotoScene( "code.home", options )
        end

    	elseif ( "request" == event.type ) then
        	print("facebook request")
        	if ( not event.isError ) then
            	local response = json.decode( event.response )
        	end

    	elseif ( "dialog" == event.type ) then
        	print( "dialog", event.response )
    	end
	end

	local function loginUser( event )
		if appId then
			fbCommand = GET_USER_INFO
			facebook.login( appId, listener )
		end
	end

	-- Creación del botón de Log In a Facebook.
	loginButton = widget.newButton
	{
		width = 370,
		height = 70,
		label = "Ingresa con Facebook",
		labelAlign = "right",
		fontSize = 30,
		onRelease = loginUser,
		labelColor = {default={255,255,255}, over={240,248,255}},
		defaultFile= "design/fbButton.png"
	}
	loginButton.x = _X
	loginButton.y = _Y + 200
	sceneGroup:insert( loginButton )
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )

return scene