import 'dart:async';

import 'package:flutter/material.dart';

import '../models/pokedex.dart';
import '../widgets/overview/pokemon_card.dart';
import '../screens/detail_screen.dart';
import '../models/pokemon.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  Pokedex pokedex = Pokedex();

  var _isLoading = false;

  double _loadingStatus = 0.0;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
    });
    final timer = Timer.periodic(Duration(milliseconds: 1), (_) {
      print(pokedex.pokemonList.length / 151);
      setState(() {
        _loadingStatus = pokedex.pokemonList.length / 151;
      });
    });
    await pokedex.fetchPokemonAPI();
    setState(() {
      _isLoading = false;
    });
    timer.cancel();
  }

  void goToDetailPage(BuildContext ctx, String id) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => DetailScreen(
          pokedex: pokedex,
          id: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Kanto Pokédex',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search by name',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.black,
                      ),
                      value: _loadingStatus,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(15),
                    child: ListView.builder(
                      itemCount: pokedex.pokemonList.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: PokemonCard(
                            id: pokedex.pokemonList[index].id,
                            name: pokedex.pokemonList[index].name,
                            types: pokedex.pokemonList[index].types,
                            imageUrl: pokedex.pokemonList[index].imageUrl,
                            goToDetailPage: goToDetailPage,
                            color: pokedex.pokemonList[index].color,
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
