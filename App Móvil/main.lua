-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local storyboard = require "storyboard"
local sqlite3 = require "sqlite3"
display.setStatusBar( display.HiddenStatusBar )
local path = system.pathForFile("BD.db", system.DocumentsDirectory)
db = sqlite3.open( path )  
local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]]
db:exec( tablesetup )
db:close( )
display.setDefault( "background", 255, 255, 255 )
local options =
{
    effect = "fade",
    time = 400,
}
storyboard.gotoScene("inicio",options)

