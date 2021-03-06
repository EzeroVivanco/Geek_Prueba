---------------------------------------------------------------------------------
-- REQUERIMIENTOS Y VARIABLES
---------------------------------------------------------------------------------

local storyboard = require "storyboard"
local dbMethods = require ("code.ConnectionDB")

---------------------------------------------------------------------------------
-- CONFIGURACIONES
---------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

---------------------------------------------------------------------------------
-- BASE DE DATOS
---------------------------------------------------------------------------------
dbMethods.CreateConection()
dbMethods.CreateTable()
dbMethods.CloseDB()

---------------------------------------------------------------------------------
-- METODOS DE ESCENA
---------------------------------------------------------------------------------
display.setDefault( "background", 255, 255, 255 )
local options =
{
    effect = "fade",
    time = 400,
}
storyboard.gotoScene("code.welcome",options)
