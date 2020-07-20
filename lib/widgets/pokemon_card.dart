import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokedex.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final Function goToDetailPage;

  PokemonCard({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
    @required this.goToDetailPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToDetailPage(context, id),
      child: Container(
        width: 180,
        height: 150,
        decoration: BoxDecoration(
          color: Color(Provider.of<Pokedex>(context).getColorCode(types[0])),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${name[0].toUpperCase() + name.substring(1)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '#${id.padLeft(3, '0')}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: types
                        .map(
                          (type) => Container(
                            child: Text(
                              '${type[0].toUpperCase() + type.substring(1)}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Hero(
                tag: id,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
