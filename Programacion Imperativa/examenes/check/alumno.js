/*
1-a: Creemos un objeto alumno que tiene como atributos, nombre (string) cantidad de faltas (number) y notas (array numeros).
*/

let alumno = {
    nombre: 'Trinidad Faccini',
    faltas: 3,
    notas: [9,10,7],
    promedio: function(){

        let sumaNotas = 0;
        for(let i = 0; i < this.notas.length; i++){
            sumaNotas += this.notas[i];
        }

        return sumaNotas / this.notas.length;
    },

    faltar: function(){
        this.faltas++;
        return this.faltas;
    }
};

/*
1-b: Crearle un constructor e importar esto como el módulo alumno.
2- : Nuestro objeto alumno va a tener el método calcular promedio que retorne el promedio de sus notas, 
también va a tener un método que se llame faltar que simplemente incrementa la cantidad de faltas por 1.

*/

function Alumno(nombre, faltas, notas){
    this.nombre = nombre
    this.faltas = faltas
    this.notas = notas
    this.promedio = function(){

        let sumaNotas = 0;
        for(let i = 0; i < this.notas.length; i++){
            sumaNotas += this.notas[i];
        }

        return (sumaNotas / this.notas.length);
    };

    this.faltar = function(){
        this.faltas++;
    }
};

let alumno1 = new Alumno("Lu", 2, [9,10,8]); 
let alumno1 = new Alumno("Trini", 2, [9,10,8]); 


let listaEstudiantes = [
    new Alumno("Agus Pasqualis", 5, [10,10,8,10,4]),
    new Alumno("Angel Vargas", 3, [4,10,5,8,10]),
    new Alumno("Ana Belen", 2, [8,9,4,10,10]),
    new Alumno("Carlos Naranjo", 1, [9,5,6,5,10]),
    new Alumno("Catalina Forgione", 7, [2,8,5,8,8])
]


module.exports = {listaEstudiantes, Alumno};
