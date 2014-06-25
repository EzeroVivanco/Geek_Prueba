---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local widget = require( "widget" )

--Variables
menu = {}

---------------------------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------------------------

function menu:new()
    
    local self = display.newGroup()

    -- Creamos Menú
    function self:builScreen()

    	--Variables
    	local _W = display.contentWidth
        local _H = display.contentHeight
        local _X = display.contentCenterX
        local _Y = display.contentCenterY


        local widget = require( "widget" )

        -- Colocamos el menu a la izquierda
        self.x = -400
        
        -- Lista de Cupones
        slideMenu = widget.newScrollView
        {
            left = 0,
            top = 0,
            width = 400,
            height = _H + 5,
            id = "slideMenu",
            horizontalScrollDisabled = true,
            verticalScrollDisabled = false,
            listener = scrollListener,
            backgroundColor = { 28/255, 28/255, 28/255 }
        }
        self:insert(slideMenu)
        
        -- Border Right
        local borderRight = display.newRect( 398, _Y, 4, _H )
        borderRight:setFillColor( {
            type = 'gradient',
            color1 = { .1, .1, .1, .7 }, 
            color2 = { .4, .4, .4, .2 },
            direction = "left"
        } ) 
        borderRight:setFillColor( 0, 0, 0 ) 
        self:insert(borderRight)
    end

    return self
end