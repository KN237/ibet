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
                    LeagueRoundedCard(),
                    LeagueRoundedCard(),
                    LeagueRoundedCard(),
                    LeagueRoundedCard(),
                    LeagueRoundedCard(),
                    LeagueRoundedCard(),
                  ]),
                ),

                SizedBox(
                  height: 20.0,
                ),

                MatchCard(),
                MatchCard(),
                MatchCard(),
                MatchCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}