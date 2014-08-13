---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local sqlite3 = require "sqlite3"
--Abre la base de datos BD.db.
--Si la base de datos no existe, la crea.
local user, password, found = false
local path = system.pathForFile("BD.db", system.DocumentsDirectory)
db = sqlite3.open( path )

---------------------------------------------------------------------------------
-- DATABASE
---------------------------------------------------------------------------------

--Creación de la tabla "user".
local function CreateTable ()
	local tablesetup = [[CREATE TABLE IF NOT EXISTS user (email, password);]] 
	db:exec( tablesetup )
end

--Inserción de registros en la base de datos.
local function InsertUser( user, password )
	local insercion = [[INSERT INTO user VALUES (']]..user..[[',']]..password..[[');]]
	db:exec(insercion)
end

--Búsqueda de un registro en la base de datos.
local function SearchUser( user, password )
	for row in db:nrows("SELECT * FROM user WHERE email='"..user.."'".." and password='"..password.."'") do
		found = true
		break
	end
	return found
end

--Cierra la conexión a Base de Datos.
local function CloseDB ()
	db:close( )
end