$(function() {
    // Menus
    $(".goTo").click(function() {
        window.location = $(this).attr("ref");
    });
    // Book Me In
    $(".bookmein").click(function() {
        showAppConteiner();
    });

});

//Esta funcion de javascript hara que en el cronometro surgan cambios de la fecha actual a la fecha de la boda.
function carga() {
    //Obtener fecha actual
    var date = new Date();
    var dayNow = date.getDate();
    var monthNow = date.getMonth() + 1;
    var yearNow = date.getFullYear();
    //obtener la hora actual
    var hourNow = date.getHours();
    var minNow = date.getMinutes();
    var secNow = date.getSeconds();
    //Fecha de la boda
    var dayBoda = 28;
    var monthBoda = 7;
    var yearBoda = 2014;
    //dias restantes
    var dayRest;
    var monthRest = monthBoda - monthNow;
    var yearRest = yearBoda - yearNow;
    if (monthRest > 0) {
        dayRest = (31 - dayNow) + ((monthRest - 1) * 31) + dayBoda;
    }
    else {
        dayRest = dayBoda - dayNow;
    }


    countSeconds = secNow;
    countMinute = (60 - minNow);
    countHour = (24 - hourNow);
    countDay = dayRest;
    seconds = 0; //Se inicia el segundo para comenzar a contar el tiempo.
    minute = document.getElementById("minutes");
    hour = document.getElementById("hours");
    day = document.getElementById("days");
    day.innerHTML = dayRest;
    minute.innerHTML = (countMinute);
    hour.innerHTML = (countHour);
    window.setInterval(
            function()
            {
                if (countSeconds == 60) {
                    countSeconds = 0;
                    countMinute--;
                    if (countMinute == 0) {
                        countMinute = 59;
                        countHour--;
                        if (countHour == 0) {
                            countHour = 23;
                            countDay--;
                            day.innerHTML = countDay;
                        }
                        minute.innerHTML = "0" + countMinute;
                        if (countHour <= 9) {
                            hour.innerHTML = "0" + countHour;
                        } else {
                            hour.innerHTML = countHour;
                        }

                    } else {
                        if (countMinute <= 9) {
                            minute.innerHTML = "0" + countMinute;
                        } else {
                            minute.innerHTML = countMinute;
                        }
                    }
                    if (countMinute == 59) {
                        minute.innerHTML = countMinute;
                    }
                }
                countSeconds++;
            }
    , 1000);
}