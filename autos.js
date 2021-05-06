const fs = require('fs');

let autosJSON = fs.readFileSync('AUTOS.json','utf8');

let autos = JSON.parse(autosJSON);

const carrera = {
    
    autos : autos,

    autosPorTanda : 4,

    autosHabilitados: function(){
        return this.autos.filter(auto => auto.sancionado === false);
    },

    listarAutos: function(arrayAutos){

        arrayAutos.forEach(auto => {
        
            let estado = auto.sancionado ? "sancionado" : "puede correr";

            console.log("Patente: " + auto.patente + ", peso en kg: " + auto.peso + ", piloto: " + auto.piloto + ", estado: " + estado); 
        });
    },

    buscarPorPatente: function(patenteBuscada){

        let autoBuscado = this.autos.find(auto => auto.patente === patenteBuscada);

        if (autoBuscado == undefined){
            autoBuscado = null;
        }

        return dptoBuscado;
    },

    buscarPorCilindrada: function(cilindrada){

        let autosHabilitados = this.autosHabilitados();

        return autosHabilitados.filter(auto => auto.cilindrada <= cilindrada);
    },

    ordenarPorVelocidad: function(){

        return this.autos.sort((a, b) => a.velocidad - b.velocidad);
    },

    generarTanda: function(cilindrada, peso){

        let autosHabilitados = this.autosHabilitados();

        let autosTanda = autosHabilitados.filter(auto =>

            auto.cilindrada <= cilindrada && auto.peso <= peso
        );

        return autosTanda;
    },

    calcularPodio: function(cilindrada, peso){

        let tandaAutos = this.generarTanda(cilindrada, peso);

        let ordenadosPuntaje = tandaAutos.sort((a, b) => a.puntaje - b.puntaje);

        let autosPodio = ordenadosPuntaje.slice(0,3);

        console.log("El ganador es: " + autosPodio[0].piloto + ", con un puntaje de: " + autosPodio[0].puntaje + ";");

        console.log(" el segundo puesto es para: " + autosPodio[1].piloto + ", con un puntaje de: " + autosPodio[1].puntaje);

        console.log(" y el tercer puesto es para: " + autosPodio[2].piloto + ", con un puntaje de: " + autosPodio[2].puntaje);

    }
};


/* 1: Variable conteniendo un array con todos los autos disponible */
console.log(autos);

/* 2 */

/* A: Agregar una propiedad llamada autos que contenga los autos obtenidos en el punto anterior*/
console.log(carrera.autos);

/* B: Agregar una propiedad llamada autosPorTanda que contenga el valor 4. Este valor representará la cantidad máxima de autos por tanda.*/
console.log(carrera.tandaAutos);

/* C:  Agregar un método autosHabilitados, que permita consultar los autos habilitados, es decir, que devuelva  una lista de los autos que no estén sancionados. Resultado esperado: un array con los autos habilitados para correr.*/
console.log(carrera.autosHabilitados());

/* D: Agregar un método listarAutos que reciba como parámetro un array de autos y los imprima por consola.
Este método deberá imprimir por cada elemento:
○ La placa o patente.
○ El piloto
○ El peso del auto
○ “sancionado” → En caso de ser true la propiedad sancionado
“puede correr” → Caso contrario
Resultado esperado: un mensaje por consola por cada auto con el siguiente formato: “Patente: XXXXXX, peso en kg: XXX, estado: sancionado/puede correr” */





