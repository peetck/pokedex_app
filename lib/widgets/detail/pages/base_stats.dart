import 'package:flutter/material.dart';

class BaseStats extends StatelessWidget {
  final Map<String, String> stats;

  BaseStats({
    @required this.stats,
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
                  'HP',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['hp'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Attack',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['attack'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Defense',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['defense'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sp. Atk',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['spAtk'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sp. Def',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['spDef'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Speed',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['speed'],
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  stats['total'],
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
