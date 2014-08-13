---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUERIMIENTOS & VARIABLES
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local widget = require( "widget" )

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

---------------------------------------------------------------------------------
-- OYENTES
---------------------------------------------------------------------------------

--Evento del botón de Registro.
local function handleButtonEvent( event )
	if (event.phase == "ended") then
		local currentScore = 200
		local options = { level="Level 1", score=currentScore }
		local results = storyboard.loadScene( "code.registration", true, options )
		storyboard.gotoScene( "code.registration")
	end
end

--Evento del botón de Inicio de Sesión.
local function handleButtonEvent2( event )
	if (event.phase == "ended") then
		storyboard.gotoScene( "code.login")
	end
end

---------------------------------------------------------------------------------
-- METODOS DE ESCENAS
---------------------------------------------------------------------------------

function scene:createScene( event )
	local sceneGroup = self.view
	
	--Se crea el botón de Inicio de Sesión.
	local startButton = widget.newButton
	{
		x = _X,
		y = _Y,
		width = 280,
		height = 100,
		label = "Iniciar sesión",
		defaultFile = "design/borderbutton.png",
		labelColor = {default={255,255,255}, over={240,248,255}},
		fontSize = 40,
		onEvent = handleButtonEvent2
	}
	sceneGroup:insert( startButton)
	
	--Se crea el botón de Registro.
	local registerButton = widget.newButton
	{
		x = _X,
		y = _H - 25,
		width = 200,
		height = 100,
		label = "Registrate",
		labelColor = {default={0,0,0}, over={240,248,255}},
		fontSize = 30,
		textOnly = true,
		onEvent = handleButtonEvent
	}
	sceneGroup:insert( registerButton )
end

function scene:enterScene( event )
	local phase = event.phase
	if "did" == phase then
		composer.removeScene( "code.registration" )
		composer.removeScene( "code.login" )
	end
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )
scene:addEventListener( "createScene", scene )

return scene