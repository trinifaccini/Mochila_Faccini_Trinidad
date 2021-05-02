let contadores = {

    contadorAdelante: function(tope){

        for(let i = 1; i <= tope; i++){
            console.log(i);
        }
    },

    contadorAtras: function(inicio){
        for(let i = inicio; i > 0; i--){
            console.log(i);
        }
    },

};

module.exports = contadores;