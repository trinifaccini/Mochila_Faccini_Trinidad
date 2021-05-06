const fs = require('fs');

let departamentoJSON = fs.readFileSync('departamentos.json','utf8');

let dptos = JSON.parse(departamentoJSON);

const inmobiliaria = {

    departamentos: dptos,
    
    departamemosDisponibles: function(){

        /* 
        SIN ARROW

        let disponibles = this.departamentos.filter(function(dpto){
            return dpto.disponible;
        });
        
        return disponibles;}
        
        CON ARROW

        let disponibles = this.departamentos.filter(dpto => dpto.disponible);
        return disponibles;
       */

        //CON ARROW + CORTA
        return this.departamentos.filter(dpto => dpto.disponible);
    },


    listarDepartamentos: function(arrayDptos){

        /*
        arrayDptos.forEach(function(dpto){

            let estado;
            if(dpto.disponible) estado = "Disponible";
            else estado = "Alquilado";

            console.log("El id del dpto es: " + dpto.id + " su precio es de: $" + dpto.precioAlquiler + " y su estado es: " + estado);
        })
        */

        arrayDptos.forEach(dpto => {
            
            let estado = dpto.disponible ? "Disponible" : "Alquilado";

            console.log("El id del dpto es: " + dpto.id + " su precio es de: $" + dpto.precioAlquiler + " y su estado es: " + estado); 
        });
    },


    buscarPorId: function(idBuscado){

        /*
        let dptoBuscado = this.departamentos.find(function(dpto){
            return dpto.id === idBuscado;
        });

        if (dptoBuscado == undefined) dptoBuscado = null;

        return dptoBuscado;
        */
 
        let dptoBuscado = this.departamentos.find(dpto => dpto.id === idBuscado);

        if (dptoBuscado == undefined) dptoBuscado = null;

        return dptoBuscado;
    },


    buscarPorPrecio: function(precio){

        let dptosDisponibles = this.departamemosDisponibles();

        /*

        let dptosPrecio = dptosDisponibles.filter(function(dpto){
            return dpto.precioAlquiler <= precio;
        });

        return dptosPrecio;
        */

        return dptosDisponibles.filter(dpto => dpto.precioAlquiler <= precio);
    },


    ordenarPorPrecio: function(){

        /*
        return this.departamentos.sort(function(a, b){

            return a.precioAlquiler - b.precioAlquiler;
        });
        */

        return this.departamentos.sort((a, b) => a.precioAlquiler - b.precioAlquiler);
    },


    precioConImpuesto: function(){

        /*
        G. Agregar un método precioConImpuesto que permita realizar un
        incremento del precioPorMes a todos los departamentos, tanto
        disponibles como no disponibles, según un porcentaje que se envía como
        argumento al momento de la invocación del método.
        ejemplo : mostrarPrecioConImpuesto(10), deberá incrementar el
        precioPorMes de Todos los departamentos un 10%
        */

        return this.departamentos.map( departamento => departamento.precioAlquiler + (departamento.precioAlquiler * porcentaje / 100) )
    },


    alquilarDepartamento: function(idBuscado){

        let dpto = this.buscarPorId(idBuscado);

        if(dpto){

            if(dpto.disponible){
                dpto.disponible = false;
                console.log("Departamento alquilado");
            }

            else console.log("El departamento no esta disponible");
        }

        else console.log("No se encontraron coincidencias");
    },


    calcularIngresoMensual: function(){

        /*
        let precioDptosAlquilados = this.departamentos.filter(function(dpto){ 
            return (dpto.disponible == false);
        });

        let total = precioDptosAlquilados.reduce(function(acum, dpto) {
            return acum + dpto.precioAlquiler;
        });
            
        return total;
        */

        let precioDptosAlquilados = this.departamentos.filter(dpto => dpto.disponible == false);

        return precioDptosAlquilados.reduce((acum, dpto) => acum + dpto.precioAlquiler, 0);
    },


    comentar: function(idBuscado, comentarioNuevo, puntuacionNueva){

        let departamento = this.buscarPorId(idBuscado);

        departamento.comentarios.push({comentarioNuevo, puntuacionNueva});

        console.log("Comentario realizado con éxito");
    },

    
    preferenciasClientes: function(habitacion, mascota, personas, precio){

        console.log(habitacion + " " + mascota + " " + personas + " " + precio);

        let dptosDisponibles = this.departamemosDisponibles();

        /*
        let dptosPreferenciales = dptosDisponibles.filter(function(dpto){

            if(dpto.cantidadHabitacion == habitacion && dpto.mascotas == mascota && dpto.cantidadPersonas == personas && dpto.precioAlquiles == precio){
                return dpto;
            }
        });

        return dptosPreferenciales;
        */

        let dptosPreferenciales = dptosDisponibles.filter(dpto =>

            dpto.cantidadHabitacion == habitacion && dpto.mascotas == mascota && dpto.cantidadPersonas == personas && dpto.precioAlquiles == precio
        );

        return dptosPreferenciales;
    }

}

inmobiliaria.comentar(1, "Bueno", 4);
console.log(inmobiliaria.buscarPorId(1));

/*EJ 1 */
console.log("****** dptos *****");
//inmobiliaria.listarDepartamentos(inmobiliaria.departamentos)
console.log();

/* EJ 2 -B */
console.log("***** disponibles *****");
inmobiliaria.listarDepartamentos(inmobiliaria.departamentosDisponibles())
console.log();

/*EJ 2 -C */
console.log("***** lista *****");
inmobiliaria.listarDepartamentos(inmobiliaria.departamentos)
console.log();

/* EJ 2 -D */
console.log("***** buscarpor ID *****");
console.log(inmobiliaria.buscarPorId(17));
console.log();

/* EJ 2 -E */
console.log("***** buscar por precio ******");
inmobiliaria.listarDepartamentos(inmobiliaria.buscarPorPrecio(4200))
console.log();

/*EJ 2 -F*/
console.log("****** ordenar por precio ******");
inmobiliaria.listarDepartamentos(inmobiliaria.ordenarPorPrecio())
console.log();

/* EJ 2 -G */
console.log("***** mostrar precio con impuesto *****");
console.log(inmobiliaria.precioConImpuesto(10))
console.log();

/* EJ 2 -H */
console.log("***** alquilar dpto *****");
inmobiliaria.alquilarDepartamento(17)
console.log(inmobiliaria.buscarPorId(17))
console.log();

/* EJ 2 -I */
console.log("***** suma alquileres *****");
console.log(inmobiliaria.ingresosMensuales())
console.log();

//*****************ADICIONALES*******************
/* Adicionales -A */
console.log("**** Comentar *****");
inmobiliaria.comentar(17, "Excelente Atencion :)", 5);
console.log(inmobiliaria.buscarPorId(17))
console.log();

/* Adicionales -B */
console.log("**** Preferencias *****");
console.log(inmobiliaria.preferenciasCliente(2, 2, 5000, true));

