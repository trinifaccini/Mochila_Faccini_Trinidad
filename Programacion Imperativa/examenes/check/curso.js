/* 
3- : En un archivos distinto, va a existir el objeto literal curso que tiene como atributo el nombre del curso (string) la nota de aprobación (number) faltas máximas (number) y una lista de estudiantes (un array compuesto de los alumnos creados en el paso 1).

4- : Crear el método que permite agregar alumnos a la lista del curso, es decir, cuando llamemos a nuestro método en nuestro objeto curso, debería agregarse un alumno más a la propiedad lista de estudiantes del obj curso.

5- : Crear un método a curso que reciba un alumno (como parámetro) y retorne true si aprobó el curso o false si no, para aprobar el alumno tiene que tener un promedio por arriba de nota de aprobación  y tener menos faltas que faltas máximas, si tiene la misma cantidad tiene que estar 10% arriba de la nota de aprobación.

*/

const archivoAlumno = require('./alumno');

let Alumno = archivoAlumno.Alumno;
let listaEstudiantes = archivoAlumno.listaEstudiantes;

let curso = {
    nombre: 'Programación imperativa',
    nota_aprobacion: 7,
    max_faltas: 2,
    listaEstudiantes,
    agregarEstudiante : function(alumno){
        this.listaEstudiantes.push(alumno);
    },

    alumnoAprobado: function(alumno){
        if(alumno.promedio > this.nota_aprobacion && alumno.faltas < this.max_faltas){
            return true;
        }
        else if(alumno.faltas == this.max_faltas && alumno.promedio >= (this.nota_aprobacion + this.nota_aprobacion*0.1)){
            return true;
        }
        else return false;
    },

    arrayAprobacion: function(){

        let array = [];

        for(let i = 0; i < this.listaEstudiantes.length; i++){
            array.push(this.alumnoAprobado(this.listaEstudiantes[i]));
        }

        return array;
    }
}; 


const autos = require("./autos");
const persona = require("./personas")