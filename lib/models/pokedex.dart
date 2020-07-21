import 'dart:convert';

import 'package:http/http.dart' as http;

import 'pokemon.dart';

class Pokedex {
  String url = 'https://pokeapi.co/api/v2/pokemon/?limit=151';

  List<Pokemon> _pokemonList = [];

  List<Pokemon> get pokemonList {
    return [..._pokemonList];
  }

  Pokemon getPokemon(String id) {
    return _pokemonList.firstWhere((pokemon) => pokemon.id == id);
  }

  void addPokemon({
    String id,
    String name,
    List<String> types,
    String imageUrl,
    String species,
    String height,
    String weight,
    List<String> abilities,
  }) {
    final Pokemon newPokemon = Pokemon(
      id: id,
      name: name,
      types: types,
      imageUrl: imageUrl,
      color: getColorCode(types[0]),
      abilities: abilities,
      height: height,
      weight: weight,
      species: species,
    );
    _pokemonList.add(newPokemon);
  }

  int getColorCode(String type) {
    Map<String, int> typeColors = {
      'grass': 0xff78c850,
      'fire': 0xffF08030,
      'water': 0xff6890f0,
      'bug': 0xffa8b820,
      'normal': 0xffa8a878,
      'poison': 0xffa040a0,
      'electric': 0xfff8d030,
      'ground': 0xffe0c068,
      'fairy': 0xffee99ac,
      'fighting': 0xffc03028,
      'psychic': 0xfff85888,
      'rock': 0xffb8a038,
      'ghost': 0xff705898,
      'ice': 0xff98d8d8,
      'dragon': 0xff7038f8,
    };
    if (typeColors.containsKey(type)) {
      return typeColors[type];
    }
    return 0xff888888;
  }

  Future<void> fetchPokemonAPI() async {
    try {
      final response = await http.get(url);
      final responseBody = json.decode(response.body);
      List<dynamic> results = responseBody['results'];

      for (int index = 0; index < results.length; index++) {
        final rawData = await http.get(results[index]['url']);
        final pokemonData = json.decode(rawData.body);
        final String id = pokemonData['id'].toString();
        final List<dynamic> types = pokemonData['types'];
        final String weight = pokemonData['weight'].toStringAsFixed(2);
        final String height = pokemonData['height'].toStringAsFixed(2);
        final List<dynamic> rawAbilities = pokemonData['abilities'];
        final List<String> abilities = [];
        for (int i = 0; i < rawAbilities.length; i++){
          final String abilityName = rawAbilities[i]['ability']['name'];
          abilities.add(abilityName);
        }

        final speciesResponse = await http.get('https://pokeapi.co/api/v2/pokemon-species/$id');
        String species = json.decode(speciesResponse.body)['genera'][7]['genus'];
        species = species.replaceAll('Pokémon', '').trim();
        addPokemon(
          id: id,
          name: pokemonData['name'].toString(),
          types: types.map<String>((type) => type['type']['name']).toList(),
          imageUrl: //pokemonData['sprites']['front_default'],
              'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.padLeft(3, '0')}.png',
          weight: weight,
          height: height,
          species: species,
          abilities: abilities,
        );
      }
      url = responseBody['next'];
    } catch (error) {
      print(error);
    }
  }
}
