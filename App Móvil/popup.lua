local composer = require( "composer" )
local widget = require( "widget")
local sqlite3 = require "sqlite3"


local scene = composer.newScene()

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight


local function handleButtonEvent( event )
	if ( "ended" == event.phase ) then
		composer.hideOverlay()
		print( "volver" )
    end
end

function scene:show( event )
	local sceneGroup = self.view

	local backgroudnPopup = display.newRoundedRect( _X, _Y, _W-60, 100, 20 )
	backgroudnPopup:setFillColor( 169/255,169/255,169/255 )

	local alert = display.newText( "Usuario y/o Contraseña invalido", _X, _Y - 20, native.systemFontBold, 18 )

	aceptarButton = widget.newButton{
		x = _X,
		y = _Y + 20,
		width = 150,
		height = 50,
		fontSize = 20,
		emboss = true,
		label = "Aceptar",
		font = native.systemFont,
		labelColor = {default={255,255,255}, over={240,248,255}},
		defaultFile = "design/borderbutton.png",
		onEvent = handleButtonEvent
	}
end

scene:addEventListener( "show", scene )

return scene