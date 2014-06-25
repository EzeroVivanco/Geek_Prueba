$(function() {
	
    // Menus
    $(".goTo").click(function() { window.location = $(this).attr("ref"); });
    // Book Me In
    $(".bookmein").click(function() { showAppConteiner(); });
    
});

//Esta funcion de javascript hara que en el cronometro surgan cambios.
function carga(){

    contador_s = 0;
    contador_m = 0;
    contador_h = 22;
    contador_d = 0;
    s = 0; //Inicio el segundo para comenzar a contar el tiempo
    m = document.getElementById("minutos");
    h = document.getElementById("horas");
    d = document.getElementById("dias");

    window.setInterval(
        function()
        {
            
            
            if(contador_s ==  60){
                contador_s = 0;
                contador_m++;
                if(contador_m == 60){
                    contador_m = 0;
                    contador_h++;
                    if(contador_h == 24){
                        contador_h = 0;
                        contador_d++;
                        d.innerHTML = contador_d;
                    }
                    m.innerHTML = "0" + contador_m;
                    if(contador_h < 10){
                        h.innerHTML = "0"+  contador_h;
                    }else{
                        h.innerHTML = contador_h;
                    }

                }else{
                    if(contador_m < 10){
                    m.innerHTML = "0"+contador_m;
                }else{
                    m.innerHTML = contador_m;
                }
                }
            }
            
            
            contador_s++;
        }
        ,1);
}