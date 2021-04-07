/*
Crear una función puedeSubir() que reciba dos parámetros: altura de la persona y si viene acompañado. 
Debe retornar un valor booleano (TRUE, FALSE) que indique si la persona puede subirse o no, basado en las siguientes condiciones:
Debe medir más de 1,40 m. y menos de 2 metros.
Si mide menos de 1,40 m., deberá venir acompañado.
Si mide menos de 1,20 m., no podrá subir ni acompañado.
Modificar la función para impedir la subida al juego si la persona fue penalizada por no respetar las normas y reglas del juego.
*/


function puedeSubir(altura, acompaniada, penalizada){

    //esta penalizado? SI, bueno entonces ni siquiera analices lo que esta dentro del if porque NO PUEDE SUBIR
    //                 anda directo a lo que esta despues de este if. Que es lo que esta despues de este if? la linea 37
    //                 que justamente dice devolve FALSO porque NO PUEDE SUBIR

    //esta penalizado? NO, bueno entonces ANALIZA lo que esta dentro de este if
    
    if(penalizada == false) {

        //LO QUE HAY ACA ES A LO QUE ME REFIERO CON "lo que esta dentro el if"
    
        //mide mas de 1.40 y menos que dos metros? SI, entonces decile que puede subir 
        if (altura >= 1.40 && altura < 2) {
            return true;

        //mide mas de 1.20, menos que 1.40 y viene acompañado? SI, entonces decile que puede subir
        } else if (altura >= 1.20 && altura < 1.40 && acompaniada == true) {
            return true;
        
        //si NO SE DIERON ninguna de las anteriores, va a devover FALSO porque no reune las condiciones necesarias para poder subir al juego 
        } else {
            return false;
        }
    }

    return false;
}

function puedeSubir(altura, acompaniada, penalizada){

    //no esta penalizado ni mide menos que 1.20 ni mas de 2 metros? bueno, entonces ANALIZA lo que hay adentro del if
    //no cumple con ALGUNA de las tres condiciones? bueno, si es asi entonces NO PUEDE SUBIR, anda directamente a la linea 62
    if(penalizada == false && altura >= 1.20 && altura < 2) {
    
        //ESTO es lo que hay "adentro del if"

        //mide mas que 1.40 (pero menos que 2 metros lo cual analice en la linea 44)? entonces PUEDE SUBIR
        if (altura >= 1.40) {
            return true;

        //mide menos que 1.40 (y mas que 1.20 lo cual analice en la linea 44) y viene acompañado? entonces PUEDE SUBIR
        } else if (altura < 1.40 && acompaniada == true) {
            return true;
        
        //si NO SE DIERON ninguna de las anteriores, va a devover FALSO porque no reune las condiciones necesarias para poder subir al juego 
        } else {
            return false;
        }
    }

    return false;
}


console.log(puedeSubir(1.50, false, true));
console.log(puedeSubir(1.50, false, false));
console.log(puedeSubir(1.20, true, false));
console.log(puedeSubir(1.10, true, false));
console.log(puedeSubir(1.30, true, false));

function esPar(valor) {
    return valor % 2 == 0 ? "Es par" : "Es impar";
}
function informarSiPuedeSubir(puedeSubir) {

     return puedeSubir == true ? "puede subir" : "no puede subir";
        
    } 
    
console.log (esPar (10) + ' y '+ informarSiPuedeSubir(puedeSubir(1.40,false,false)));




