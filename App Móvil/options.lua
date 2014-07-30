---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local widget = require( "widget" )

--Variables
options = {}

---------------------------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------------------------

function options:new(firstName,lastName,id)
    
    self = display.newGroup()
    
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

        local imgUser = display.newImageRect( firstName..lastName..id..".png", system.TemporaryDirectory, 80, 80 )
        imgUser.x = 50
        imgUser.y = 50
        self:insert(imgUser)
    end

    return self
end