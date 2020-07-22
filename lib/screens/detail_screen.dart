import 'package:flutter/material.dart';

import '../models/pokedex.dart';
import '../models/pokemon.dart';
import '../widgets/detail/top_detail_card.dart';
import '../widgets/detail/bottom_detail_card.dart';

class DetailScreen extends StatefulWidget {
  final Pokedex pokedex;
  final String id;

  DetailScreen({
    this.pokedex,
    this.id,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Pokemon pokemon;
  @override
  void initState() {
    pokemon = widget.pokedex.getPokemon(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void nextAndBackHandler(BuildContext ctx, int value) {
      final nextId = int.parse(pokemon.id) + value;
      final nextPokemon = widget.pokedex.getPokemon(nextId.toString());

      setState(() {
        pokemon = nextPokemon;
      });
    }

    return Scaffold(
      backgroundColor: Color(pokemon.color),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            TopDetailCard(
              id: pokemon.id,
              name: pokemon.name,
              types: pokemon.types,
              imageUrl: pokemon.imageUrl,
              nextAndBackHandler: nextAndBackHandler,
            ),
            Expanded(
              child: BottomDetailCard(
                weight: pokemon.weight,
                height: pokemon.height,
                species: pokemon.species,
                abilities: pokemon.formatAbilities(),
                baseExperience: pokemon.baseExperience,
                stats: pokemon.stats,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
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
      ),
    );
  }
}
