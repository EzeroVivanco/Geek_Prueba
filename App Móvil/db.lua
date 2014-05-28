----------------nt-------------------------------------------------------------------------
--
-- db.lua
--
-----------------------------------------------------------------------------------------
local sqlite3 = require "sqlite3"
local json = require ("json")
local parametros

function scene:create( event )
	local function networkListener( event  )
        if ( event.isError ) then
                print( "Network error!")
        else
                myNewData = event.response
                print ("From server: "..myNewData)
                decodedData = (json.decode( myNewData))
                SaveData()
        end
	end
	network.request( "http://www.BurtonsMediaGroup.com/myMovies.php", "POST", networkListener, {event.params.user, event.params.user} )
end
scene:addEventListener( "create", scene )