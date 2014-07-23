$(function() {
	
    // Menus
    $(".goTo").click(function() { window.location = $(this).attr("ref"); });
    // Book Me In
    $(".bookmein").click(function() { showAppConteiner(); });
    
});

//Esta funcion de javascript hara que en el cronometro surgan cambios.
function carga(){

    //Obtener fecha actual
    var fecha = new Date();
    var dayNow = fecha.getDate();
    var monthNow = fecha.getMonth()+1;
    var yearNow = fecha.getFullYear();
    //obtener la hora actual
    var hourNow = fecha.getHours();
    var minNow = fecha.getMinutes();
    var secNow = fecha.getSeconds();
    //Fecha de la boda
    var dayBoda = 28;
    var monthBoda = 7;
    var yearBoda = 2014;
    //dias restantes
    var dayRest;
    var monthRest = monthBoda - monthNow;
    var yearRest = yearBoda - yearNow;
    if(monthRest > 0){
        dayRest = (31 - dayNow) + ((monthRest-1) * 31) + dayBoda;
    }
    else{
        dayRest = dayBoda - dayNow;
    }


    contador_s = secNow;
    contador_m = (60-minNow);
    contador_h = (24-hourNow);
    contador_d = dayRest;
    s = 0; //Inicio el segundo para comenzar a contar el tiempo
    m = document.getElementById("minutos");
    h = document.getElementById("horas");
    d = document.getElementById("dias");
    d.innerHTML= dayRest;
    m.innerHTML = (contador_m);
    h.innerHTML = (contador_h);
    window.setInterval(
        function()
        {
            
            
            if(contador_s ==  60){
                contador_s = 0;
                contador_m--;
                if(contador_m == 0){
                    contador_m = 59;
                    contador_h--;
                    if(contador_h == 0){
                        contador_h = 23;
                        contador_d--;
                        d.innerHTML = contador_d;
                    }
                    m.innerHTML = "0" + contador_m;
                    if(contador_h <= 9){
                        h.innerHTML = "0" + contador_h;
                    }else{
                        h.innerHTML = contador_h;
                    }

                }else{
                    if(contador_m <= 9){
                    m.innerHTML = "0"+contador_m;
                }else{
                    m.innerHTML = contador_m;
                }
                }
                if(contador_m == 59){
                    m.innerHTML = contador_m;
                }
            }
            
            
            contador_s++;
        }
        ,1000);
}