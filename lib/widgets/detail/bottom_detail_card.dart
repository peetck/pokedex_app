import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/base_stats.dart';

enum TabBarSelection {
  ABOUT,
  BASE_STATS,
}

class BottomDetailCard extends StatefulWidget {
  final String species;
  final String height;
  final String weight;
  final String abilities;
  final String baseExperience;
  final Map<String, String> stats;

  BottomDetailCard({
    @required this.species,
    @required this.height,
    @required this.weight,
    @required this.abilities,
    @required this.baseExperience,
    @required this.stats,
  });

  @override
  _BottomDetailCardState createState() => _BottomDetailCardState();
}

class _BottomDetailCardState extends State<BottomDetailCard> {
  TabBarSelection currentTab = TabBarSelection.ABOUT;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab = TabBarSelection.ABOUT;
                    });
                  },
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 15,
                      color: currentTab == TabBarSelection.ABOUT
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab = TabBarSelection.BASE_STATS;
                    });
                  },
                  child: Text(
                    'Base stats',
                    style: TextStyle(
                      fontSize: 15,
                      color: currentTab == TabBarSelection.BASE_STATS
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            if (currentTab == TabBarSelection.ABOUT)
              About(
                species: widget.species,
                height: widget.height,
                weight: widget.weight,
                abilities: widget.abilities,
                baseExperience: widget.baseExperience,
              ),
            if (currentTab == TabBarSelection.BASE_STATS)
              BaseStats(
                stats: widget.stats,
              ),
          ],
        ),
      ),
    );
  }
}
