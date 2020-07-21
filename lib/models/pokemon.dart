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
  });

  String formatAbilities() {
    String ability = '';
    for (int i = 0; i < abilities.length; i++) {
      ability += (abilities[i][0].toUpperCase() + abilities[i].substring(1)) +
          (i != abilities.length - 1 ? ', ' : '');
    }
    return ability;
  }
}
