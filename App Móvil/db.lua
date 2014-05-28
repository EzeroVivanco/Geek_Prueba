----------------nt-------------------------------------------------------------------------
--
-- db.lua
--
-----------------------------------------------------------------------------------------
local sqlite3 = require "sqlite3"

local path = system.pathForFile("weedingDB.sql", system.ResourceDirectory)
db = sqlite3.open( path )

local function onSystemEvent( event )
    if( event.type == "applicationExit" ) then              
        db:close()
    end
end