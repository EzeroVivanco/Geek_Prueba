<html>
<head>
	<title>Usuario</title>
</head>
<body><h1>persona</h1>
    <p><?php foreach ($consulta->result_array() as $fila)
        {
            echo $fila['id']; 
            echo "</br>";
            echo $fila['username'];
            echo "</br>";
            echo $fila['password'];
            echo "</br>";
            echo $fila['nombre'];
            echo "</br>";
            echo $fila['email'];
            echo "</br>";
            echo $fila['status'];
            echo "</br>";
        }
            echo 'Resultados Totales: ' . $consulta->num_rows(); ?>
    </p>
</body>
</html>

