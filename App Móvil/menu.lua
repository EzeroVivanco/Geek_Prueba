---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local facebook = require( "facebook" )
local json = require( "json" )
local widget = require( "widget" )

--Variables
menu = {}
local appId = "807125025972663"

---------------------------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------------------------

function menu:new(phase)    
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
            backgroundColor = { 0/255, 0/255, 0/255 }
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

        local function listener( event )
            print( "event.name", event.name )  --"fbconnect"
            print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
            print( "isError: " .. tostring( event.isError ) )
            print( "didComplete: " .. tostring( event.didComplete ) )

            --Descarga la foto de perfil del usuario.
            local function networkListener( event )
                if event.isError then
                    native.showAlert( "Network Error", "Download of profile picture failed, please check your network connection", { "OK" } )
                elseif (event.phase == "ended") then
                    local imgUser = display.newImageRect( firstName..lastName..id..".png", system.TemporaryDirectory, 80, 80 )
                    imgUser.x = _X
                    imgUser.y = _Y + 200
                    self:insert( imgUser )
                end
            end

            --Verifica si existe una sesión.
            if ( "session" == event.type ) then
                --options are: "login", "loginFailed", "loginCancelled", or "logout"
                if ( "login" == event.phase ) then
                    --code for tasks following a successful login
                end
            elseif ( "request" == event.type ) then
                if ( not event.isError ) then
                    local response = json.decode( event.response )
                    usuarioText = display.newText( response.name, 0, 0, native.systemFont, 30 )
                    usuarioText.x = _X
                    usuarioText.y = _Y 
                    usuarioText:setFillColor( 255/255,255/255,255/255 )
                    self:insert( usuarioText )
                    firstName = response.first_name
                    lastName = response.last_name
                    id = response.id
                    network.download( "http://graph.facebook.com/" .. id .. "/picture", "GET", networkListener, firstName .. lastName .. id .. ".png", system.TemporaryDirectory )
                        --process response data here
                end
            elseif ( "dialog" == event.type ) then
                print( "dialog", event.response )
                --handle dialog results here
            end
        end
        facebook.login( appId, listener )
        if(phase) then
            facebook.request( "me" )
        end
    end
    return self
end