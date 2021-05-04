// dado el json PELICULAS.JSON, necesitamos poder leer su contenido y manejarlo como un array de objetos para poder realizar el siguiente sistema de gestion de pelis

let sistemaDePeliculas = {
    listaPeliculas : [], //agregar las peliculas que nos trajimos de nuestro archivo json. esta bien que aparezca como un array vacio o que deberia haber en su lugar?
    agregarPelicula:, //metodo para poder agregar peliculas a listaPeliculas
    buscarPeliPorTitulo:,//metodo para buscar peliculas por su titulo, recibe el titulo por parametro
    buscarPeliPorDirector:, //metodo para buscar peliculas por su director, que lo recibe por parametro
    modificarOscar:, //modifica la propiedad ganoOscar, es decir, si lo habia ganado se lo saca y si no se lo entrega!
    filtrarPeliculasPorGenero:, //metodo para obtener una lista de pelis que sean del genero que le pasemos por parametro
    filtrarPeliculaPorCalificacion:, //metodo que filtra las peliculas que tengan una calificacion mayor a la que le indiquemos por parametro
    ordenarPelisPorDuracion:, //metodo que ordene la lista de peliculas por su duracion de menor a mayor
    ordenarPelisPorCalificacion:, //metodo para ordernar las peliculas por su calificacion de MAYOR A MENOR!!!
    sumarCalificacion:, //metodo para poder sumarle una x cantidad de puntaje al que ya contienen las peliculas, retorna un array solo con la nueva calificacion.
    ///// DE ACA PARA ABAJO SE COMPLICAN ///
    modificarGenero:, // metodo que encuentra una sola pelicula y le modifica el genero existente (puede agregarle uno, eliminarlo y dejarlo pendiente o simplemente reemplazarlo por otro)
    peliculasQuePuedoVer:, //metodo que al ingresarle una cantidad de minutos, me devuelva una lista de peliculas cuya duracion sea menor a la ingresada
    tengoTiempoDeVerla:, // metodo que al ingresarle una cantidad de minutos y el nombre de una pelicula, la busque y le encuentre, y me diga si los minutos que yo tengo, alcanzan para que termine de ver la pelicula.
    eliminarPorCalificacion:, // metodo que al ingresarle una calificacion ELIMINE todas las peliculas cuya calificacion sea menor a la ingresada por parametro y decuelva las peliculas eliminadas.
}