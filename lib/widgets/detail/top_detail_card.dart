import 'package:flutter/material.dart';

class TopDetailCard extends StatelessWidget {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final Function nextAndBackHandler;

  TopDetailCard({
    this.id,
    this.name,
    this.types,
    this.imageUrl,
    this.nextAndBackHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${name[0].toUpperCase() + name.substring(1)}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '#${id.padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
        Hero(
          tag: id,
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(80),
            ),
            width: 150,
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
    );
  }
}
