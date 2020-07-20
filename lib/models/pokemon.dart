import 'package:flutter/foundation.dart';

class Pokemon {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final int color;

  Pokemon({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
    @required this.color,
  });
}
