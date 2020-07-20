import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon_card.dart';
import '../screens/detail_screen.dart';
import '../providers/pokedex.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  var _isLoading = false;

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Pokedex>(context, listen: false).fetchPokemonAPI();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  void goToDetailPage(BuildContext ctx, String id) {
    Navigator.of(ctx).pushNamed(DetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Pokedex',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Pokedex>(
                    builder: (ctx, pokedex, _) => Padding(
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
