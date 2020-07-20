import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = ModalRoute.of(context).settings.arguments as Pokemon;

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
                  icon: Icon(Icons.arrow_back),
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
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${pokemon.name[0].toUpperCase() + pokemon.name.substring(1)}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '#${pokemon.id.padLeft(3, '0')}',
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
                      children: pokemon.types
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
                tag: pokemon.id,
                child: Container(
                  width: 200,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/pokeball.png'),
                    image: NetworkImage(
                      pokemon.imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Base stats',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Evolution',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Moves',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
