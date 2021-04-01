//1
let films = ["star wars", "totoro",  "rocky", "pulp fiction",  "la vida es bella"];

console.log(films[1]);

//2
films[0] = films[0].toUpperCase();
films[1] = films[1].toUpperCase();
films[2] = films[2].toUpperCase();
films[3] = films[3].toUpperCase();
films[4] = films[4].toUpperCase();

console.log(films);

//3
let cartoons = ["toy story", "finding Nemo", "kung-fu panda", "wally", "fortnite"];

//4
cartoons.pop();

films.push(cartoons[0]);
films.push(cartoons[1]);
films.push(cartoons[2]);
films.push(cartoons[3]);

console.log(films);

//5
const asiaScores = [8, 10, 6, 9, 10, 6, 6, 8];
const euroScores = [8, 10, 6, 8, 10, 6, 7, 9]; 

function comparacion(){

    if(asiaScores[0] == euroScores[0] && asiaScores[1] == euroScores[1] && asiaScores[2] == euroScores[2] && asiaScores[3] == euroScores[3] && asiaScores[4] == euroScores[4] && asiaScores[5] == euroScores[5] && asiaScores[6] == euroScores[6] && asiaScores[7] == euroScores[7]){
        return "iguales";
    }
    else{
        return "diferentes";
    }
}

console.log("Las calificaciones son " + comparacion());