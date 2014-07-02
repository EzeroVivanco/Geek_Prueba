local storyboard = require( "storyboard" )
local widget = require( "widget" )

local scene = storyboard.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local function handleButtonEvent( event )
	if (event.phase == "ended") then
		local currentScore = 200
		local options = { level="Level 1", score=currentScore }
		local results = storyboard.loadScene( "formulario", true, options )
		storyboard.gotoScene( "formulario")
	end
end

local function handleButtonEvent2( event )
	if (event.phase == "ended") then
		storyboard.gotoScene( "login")
	end
end

function scene:createScene( event )
	local sceneGroup = self.view

	local botonInicio = widget.newButton
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
	sceneGroup:insert( botonInicio)
	
	local botonRegistro = widget.newButton
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
	sceneGroup:insert( botonRegistro )
end

function scene:enterScene( event )
	local phase = event.phase
	if "did" == phase then
		composer.removeScene( "formulario" )
		composer.removeScene( "login" )
	end
end

function scene:exitScene( event )
	storyboard.purgeOnSceneChange = true
end

scene:addEventListener( "enterScene", scene )
scene:addEventListener("exitScene", scene )
scene:addEventListener( "createScene", scene )

return scene