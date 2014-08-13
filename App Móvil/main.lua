---------------------------------------------------------------------------------
-- LIBRERIAS Y VARIABLES
---------------------------------------------------------------------------------

local storyboard = require "storyboard"
local sqlite3 = require "sqlite3"
local path = system.pathForFile("BD.db", system.DocumentsDirectory)
db = sqlite3.open( path )

---------------------------------------------------------------------------------
-- CONFIGURACIONES 
---------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

---------------------------------------------------------------------------------
-- BASE DE DATOS
---------------------------------------------------------------------------------

--Creación de la base de datos.
local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]] 
db:exec( tablesetup )
db:close( )
display.setDefault( "background", 255, 255, 255 )
local options =
{
    effect = "fade",
    time = 400,
}

---------------------------------------------------------------------------------
-- METODOS DE ESCENA
---------------------------------------------------------------------------------

storyboard.gotoScene("welcome",options)