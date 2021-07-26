import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_pos/components/categoryItem.dart';
import 'package:pokedex_pos/models/pokemon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = <String>[
    "Kanto",
    "Paleta",
  ];

  int selectedPokemon = 0;
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //backgroundColor: Colors.white,
        leading: Icon(Icons.circle, color: Colors.black),
        title: Text("Pokedex"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Prueba'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryItem(text: "Kanto", selected: true),
                      CategoryItem(text: "Paleta", selected: false),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pokemons.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPokemon = index;
                            });
                          },
                          child: Container(
                            color: index == selectedPokemon
                                ? Colors.red
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Placeholder(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(pokemons[index].name),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Description: "),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
