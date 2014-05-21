<<html>
<head>
	<title>Usuario</title>
</head>
<body><h1>persona</h1>
    <p><?php foreach($persona as $fila);?>
    <h1><?=$fila['persona']; ?></h1>
    <?phpendforeach; ?>
    </p>
</body>
</html>

