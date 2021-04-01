/*let recipiente1 = "azul";
let recipiente2 = "rojo";
let recipiente_aux = recipiente2;
recipiente2 = recipiente1;
recipiente1 = recipiente_aux;

console.log(recipiente1);
console.log(recipiente2);

//1) Crear la función calcularIndiceDeMasaCorporal que reciba la altura en centímetros y el peso en kilogramos y calcule el imc del usuario (peso / altura2).

//al cuadrado altura ** 2

function calcularIndiceDeMasaCorporal(peso, altura){
    let altura2 = altura * altura;
    return (peso / altura2);
}

console.log(calcularIndiceDeMasaCorporal(55,1.60));


2) Crear las 4 funciones expresadas (dentro de variables) básicas de una calculadora:
Suma
Resta
Multiplicación
División.
Las 4 funciones deberán recibir dos parámetros y retornar el resultado de la operación matemática correspondiente.


let suma = function(numA, numB){
    return numA + numB;
}

let resta = function(numA, numB){
    return numA - numB;
}

let multiplicacion = function(numA, numB){
    return numA * numB;
}

let division = function(numA, numB){
    return numA / numB;
}

console.log(suma(5,7));
console.log(resta(5,3));
console.log(multiplicacion(5,3));
console.log(division(6,3));


3) Crear las variables, nombreJugador, golesJugador, precioEnDolares. Después, crear la funcion hacerGol que incremente la cantidad de goles del jugador en uno e imprima por pantalla “GOL!!!!!!!!!”. Además, deberá incrementar el valor del jugador en 10.000 dólares. A continuación, pruebe ejecutar varias veces la función e imprimir por pantalla la nueva cantidad de goles del jugador y el precio del jugador en el mercado.*/

let nombreJugador;
let golesJugador = 0;
let precioEnDolares = 0;

function hacerGol(){
    golesJugador++;
    console.log("GOL!!!!!!!");
    precioEnDolares +=+ 10000;
}

hacerGol();

console.log(golesJugador);
console.log(precioEnDolares);

/*
4) Crear la función hattrick que simplemente en su interior ejecute tres veces la función hacerGol y aumente el valor del jugador en un 10% extra anual respecto al valor actual. 
*/

function hattrick(){
    hacerGol();
    hacerGol();
    hacerGol();
    precioEnDolares += precioEnDolares * 0.1;
}

hattrick();
console.log(golesJugador);
console.log(precioEnDolares);

