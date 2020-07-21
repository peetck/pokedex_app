import 'package:flutter/material.dart';

import '../models/pokedex.dart';
import '../models/pokemon.dart';
import '../widgets/detail/top_detail_card.dart';
import '../widgets/detail/bottom_detail_card.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final Pokedex pokedex = data['pokedex'];
    final Pokemon pokemon = data['pokemon'];

    void nextAndBackHandler(BuildContext ctx, int value) {
      final nextId = int.parse(pokemon.id) + value;
      final nextPokemon = pokedex.getPokemon(nextId.toString());
      Navigator.of(ctx)
          .pushReplacementNamed(DetailScreen.routeName, arguments: {
        'pokemon': nextPokemon,
        'pokedex': pokedex,
      });
    }

    return Scaffold(
      backgroundColor: Color(pokemon.color),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          TopDetailCard(
            id: pokemon.id,
            name: pokemon.name,
            types: pokemon.types,
            imageUrl: pokemon.imageUrl,
          ),
          BottomDetailCard(
            weight: pokemon.weight,
            height: pokemon.height,
            species: pokemon.species,
            abilities: pokemon.formatAbilities(),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: pokemon.id != '1'
                      ? () => nextAndBackHandler(context, -1)
                      : null,
                  icon: Icon(Icons.arrow_back),
                  label: Text('Previous'),
                ),
                FlatButton.icon(
                  onPressed: pokemon.id != '151'
                      ? () => nextAndBackHandler(context, 1)
                      : null,
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Forward'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
