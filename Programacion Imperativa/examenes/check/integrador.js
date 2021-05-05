//EJERCICIO 1

let autos = [

    {
        marca: 'Ford',
        modelo: 'Fiesta' ,
        precio: 150000,
        km: 200,
        color: 'Azul',
        cuotas: 12,
        anio: 2019,
        patente: 'APL123',
        vendido: false,
    },

    {
        marca: 'Toyota',
        modelo: 'Corolla' ,
        precio: 100000,
        km: 0,
        color: 'Blanco',
        cuotas: 14,
        anio: 2019,
        patente: 'JJK116',
        vendido: false,
    }
]

//RESTO DE EJERCICIOS
//const autos = require('./autos');

const concesionaria = {

    autos: autos,
    buscarAuto: function(patenteBuscada){ 

        /*
        let auto = null;
        for(let i = 0; i < this.autos.length; i++){
            if(this.autos[i].patente == patenteBuscada){
                auto = this.autos[i];
            }
        }
        
        return auto;
        */

        let autoFind = this.autos.find(function(auto){
            return auto.patente === patenteBuscada;
        });

        if (autoFind == undefined) autoFind = null;

        return autoFind;
    },

    venderAuto: function(patente){
        
        let auto = this.buscarAuto(patente);

        if(auto !== null)
        auto.vendido = true;
    },
    
    autosParaLaVenta: function(){
       
        /*
        let autos = [];
    
        for(let i = 0; i < this.autos.length; i++){
            if(this.autos[i].vendido == false){
                autos.push(this.autos[i]);
            }
        }

        return autos;
        */

        let autosFilter = this.autos.filter(function(auto){
            return auto.vendido === false;
        });
        
        return autosFilter;
    },

   autosNuevos: function(){
       
        let vendibles = this.autosParaLaVenta();

        /*
        let autos0KM = [];

        for(let i = 0; i < vendibles.length; i++){
            if(vendibles[i].km < 100){
                autos0KM.push(vendibles[i]);
            }
        }

        return autos0KM;
        */

        let autos0KMFilter = vendibles.filter(function(auto){ 
            
            return auto.km < 100;
        });
        
        return autos0KMFilter;
    },

   listaDeVentas: function(){
       
        /*
        let listaVentas = [];

        for(let i = 0; i < this.autos.length; i++){
            if(this.autos[i].vendido == true){
                listaVentas.push(this.autos[i].precio);
            }
        }

        return listaVentas;
        */

        let vendidos = this.autos.filter(function(auto){ 
            return auto.vendido;
        });

        return vendidos.map(function(auto){
            return auto.precio;
        });
    },

    totalDeVentas: function(){

        let precios = this.listaDeVentas();

        /*
        let total = 0;

        for (let i = 0; i < precios.length; i++){
            total += precios[i];
        }

        return total;
        */

        let total = precios.reduce(function(acum, precio) {
            return acum + precio;
        });
            
        return total;

    },

    puedeComprar: function(auto, persona){

        let precioCuotaAuto = auto.precio / auto.cuotas;

        if(auto.precio <= persona.capacidadDePagoTotal && precioCuotaAuto <= persona.capacidadDePagoEnCuotas){
            return true;
        }

        else return false;

    },

    autosQuePuedeComprar: function(persona){

        autosDisponibles = this.autosParaLaVenta();
        autosPosibles = [];

        for(let i = 0; i < autosDisponibles.length; i++){

            if(this.puedeComprar(autosDisponibles[i], persona) == true){
                autosPosibles.push(autosDisponibles[i]);
            }
        }        

        return autosPosibles;
    }

};