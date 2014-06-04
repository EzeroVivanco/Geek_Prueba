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

function scene:create( event )
	local sceneGroup = self.view

	local fondo = display.newRect( _X, _Y, _W, _H )
	fondo:setFillColor( 255,255,255 )
	sceneGroup:insert( fondo )

	local path = system.pathForFile("BD.db", system.DocumentsDirectory)
	db = sqlite3.open( path )  

	local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
	end

	local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]]
	print(tablesetup)
	db:exec( tablesetup )
	local campoUsuario, campoPass, campoPass2

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

	campoUsuario = native.newTextField( _X, _Y - 40, 250, 40 )
	campoUsuario.inputType = "email"
	campoUsuario.placeholder = "ejemplo@mail.com"

	campoPass = native.newTextField( _X, _Y + 40, 250, 40 )
	campoPass.isSecure = true

	campoPass2 = native.newTextField( _X, _Y + 120, 250, 40 )
	campoPass2.isSecure = true

	sceneGroup:insert( campoUsuario )
	sceneGroup:insert( campoPass )
	sceneGroup:insert( campoPass2 )

	local function registrar( evento )
		if ( "ended" == evento.phase) then
			db = sqlite3.open( path ) 
			local insercion = [[INSERT INTO user VALUES (']]..campoUsuario.text..[[',']]..campoPass2.text..[[');]]
			db:exec(insercion)
			db:close()
		end
	end

	local botonAceptar = widget.newButton
	{
		x = display.contentCenterX,
		y = display.contentCenterY + 135,
		left = 100,
<<<<<<< HEAD
		top = _Y + 150,
		width = 120,
=======
		top = 350,
		width = 150,
>>>>>>> 73e0c05bd5cbcf122d8742a523fea8c3020a616c
		height = 50,
		defaultFile = "design/borderbutton.png",
		label = "Aceptar",
		labelColor = {default={255,255,255}, over={240,248,255}},
		onEvent = registrar
	}
	sceneGroup:insert( botonAceptar )
	Runtime:addEventListener( "system", onSystemEvent )
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

