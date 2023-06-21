import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';

class Fixtures extends StatelessWidget {
  const Fixtures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FrontHelpers().blanc,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                   LeagueRoundedCard(image: "league1.png", name: " League 1"),
                    LeagueRoundedCard(image: "league2.png", name: " League 2"),
                    LeagueRoundedCard(image: "league3.png", name: " League 3"),
                    LeagueRoundedCard(image: "league4.png", name: " League 4"),
                    LeagueRoundedCard(image: "league5.png", name: " League 5"),
                  ]),
                ),

                SizedBox(
                  height: 20.0,
                ),

                MatchCard(status: false,),
                MatchCard(status: true,),
                MatchCard(status: true,),
                MatchCard(status: false,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}