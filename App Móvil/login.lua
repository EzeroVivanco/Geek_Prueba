----------------nt-------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local facebook = require( "facebook" )
local json = require( "json" )
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local appId = nil			-- Add the Facebook App ID string here
local fbCommand = nil
local GET_USER_INFO = "getInfo"

if not appId then	
			-- Handle the response from showAlert dialog boxbox
		--
		local function onComplete( event )
			if event.index == 1 then
				system.openURL( "http://developers.facebook.com/docs/guides/canvas/" )
			end
		end

		native.showAlert( "Error", "To develop for Facebook Connect, you need to get an API key and application secret. This is available from Facebook's website.",
			{ "Learn More", "Cancel" }, onComplete )
end

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

	local function facebookListener( event )
		if "request" == event.type then		

			if event.isError then
				native.showAlert( "Request Error", "Error trying to get the current user", { "OK" } )
				spinner.isVisible = false
				return
			end

			local response = json.decode( event.response )

			if response then
				composer.userData.firstName = response.first_name
				composer.userData.lastName = response.last_name
				composer.userData.id = response.id
			end
		
			local function networkListener( event )
				if event.isError then
					native.showAlert( "Network Error", "Download of profile picture failed, please check your network connection", { "OK" } )
				else
					print( "Profile picture downloaded successfully" )
				end
				
				loginButton.isVisible = false
				--spinner.isVisible = false
				
				-- Go to the main screen
				composer.gotoScene( "principal", "crossFade" )
				
				-- Show the composer navBar group
				--composer.navBarGroup.isVisible = true
			end
			
			-- Download the profile picture
			local path = system.pathForFile( composer.userData.firstName .. composer.userData.lastName .. composer.userData.id .. ".png", system.TemporaryDirectory )
			local picDownloaded = io.open( path )

			if not picDownloaded then
				--network.download( "http://graph.facebook.com/" .. composer.userData.id .. "/picture", "GET", networkListener, composer.userData.firstName .. composer.userData.lastName .. composer.userData.id .. ".png", system.TemporaryDirectory )
			else
				--loginButton.isVisible = true
				--spinner.isVisible = false
				
				-- Go to the main screen
				--composer.gotoScene( "mainScreen", "crossFade" )
				
				-- Show the composer navBar group
				--composer.navBarGroup.isVisible = true
			end
		
		-- After a successful login event, send the FB command
		-- Note: If the app is already logged in, we will still get a "login" phase
	    elseif "session" == event.type then
	        -- event.phase is one of: "login", "loginFailed", "loginCancelled", "logout"
				
			if event.phase ~= "login" then
				-- Exit if login error
				return
			end
			
			-- Request the current logged in user's info
			if fbCommand == GET_USER_INFO then
				facebook.request( "me" )
			end
	    end
	
		return true
	end

	local function loginUser( event )
		if appId then	
			-- only call login if the app ID is defined
			--event.target.isVisible = false
			--spinner.isVisible = true
			--spinner:start()
			-- call the login method of the FB session object, passing in a handler
			-- to be called upon successful login.
			fbCommand = GET_USER_INFO
			facebook.login( appId, facebookListener )
		end
	end

	-- Create a button to login the user
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