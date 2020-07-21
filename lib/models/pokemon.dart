import 'package:flutter/foundation.dart';

class Pokemon {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final int color;
  final String species;
  final String height;
  final String weight;
  final List<String> abilities;
  final String baseExperience;
  final Map<String, String> stats;

  Pokemon({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
    @required this.color,
    @required this.species,
    @required this.height,
    @required this.weight,
    @required this.abilities,
    @required this.baseExperience,
    @required this.stats,
  });

  String formatAbilities() {
    /* for (int i = 0; i < abilities.length; i++) {
      ability += (abilities[i][0].toUpperCase() + abilities[i].substring(1)) +
          (i != abilities.length - 1 ? ', ' : '');
    } */
    return abilities[0][0].toUpperCase() + abilities[0].substring(1);
  }
}
