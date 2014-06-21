-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require "composer"
local sqlite3 = require "sqlite3"
local widget = require( "widget" )

local path = system.pathForFile("BD.db", system.DocumentsDirectory)
	db = sqlite3.open( path )  

local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]]
print(tablesetup)
db:exec( tablesetup )
db:close()

display.setDefault( "background", 255, 255, 255 )
composer.gotoScene("inicio","fade",400)

