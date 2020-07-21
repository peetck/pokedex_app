import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String species;
  final String height;
  final String weight;
  final String abilities;
  final String baseExperience;

  About({
    @required this.species,
    @required this.height,
    @required this.weight,
    @required this.abilities,
    @required this.baseExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                  '${height} cm',
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
                  '${weight} kg',
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Base Experience',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  baseExperience,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
