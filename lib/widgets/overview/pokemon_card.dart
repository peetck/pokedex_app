import 'package:flutter/material.dart';


class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final Function goToDetailPage;
  final int color;

  PokemonCard({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
    @required this.goToDetailPage,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(id),
      onTap: () => goToDetailPage(context, id),
      child: Container(
        width: 180,
        height: 160,
        decoration: BoxDecoration(
          color: Color(color),
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
                  Container(
                    width: 160,
                    child: Text(
                      '${name[0].toUpperCase() + name.substring(1)}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '#${id.padLeft(3, '0')}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
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
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              color: Colors.black.withOpacity(0.2),
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
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.black.withOpacity(0.1),
              ),
              child: Hero(
                tag: id,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/pokeball.png'),
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
