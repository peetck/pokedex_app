import 'package:flutter/material.dart';

class BottomDetailCard extends StatelessWidget {
  final String species;
  final String height;
  final String weight;
  final String abilities;

  BottomDetailCard({
    @required this.species,
    @required this.height,
    @required this.weight,
    @required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Species',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            species,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Height',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            '$height cm',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            '$weight kg',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Abilities',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            abilities,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
