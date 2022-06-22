import 'package:flutter/material.dart';
import 'package:pokedex/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: bodyContainer(context),
    );
  }

  Stack bodyContainer(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (2 / 3),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text("Height : " + pokemon.height),
                Text("Weight : " + pokemon.weight),
                Text(
                  "Types",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
                Text(
                  "Prev Evolution",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((prevEvolution) => Chip(
                                  backgroundColor: Colors.deepOrange.shade300,
                                  label: Text(
                                    prevEvolution.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("İlk hali")]),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                  backgroundColor: Colors.deepOrange.shade300,
                                  label: Text(
                                    evolution.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("Son hali")]),
                Text(
                  "Weakness",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weaknesses) => Chip(
                                  backgroundColor: Colors.deepOrange.shade300,
                                  label: Text(
                                    weaknesses,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()
                        : [Text("Zayıflığı yok")]),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
