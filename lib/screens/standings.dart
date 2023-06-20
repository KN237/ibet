import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';

class Standings extends StatelessWidget {
  const Standings({super.key});

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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Standing(),
                        Standing(),
                        Standing(),
                        Standing(),
                        Standing(),
                        Standing(),
                        Standing(),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Standing extends StatelessWidget {
  const Standing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 100.0),
          child: Row(
            children: [
              Text("1"),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/fcb.png",
                width: 15,
              ),
              SizedBox(
                width: 05,
              ),
              Text("FC Barcelone"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("4"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("4"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("0"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("0"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("11"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("3"),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Text("8"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15, right: 20.0),
          child: Row(
            children: [
              MatchStateWidget(),
              MatchStateWidget(),
              MatchStateWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class MatchStateWidget extends StatelessWidget {
  const MatchStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: FrontHelpers().vert,
      radius: 10,
      child: Icon(Icons.check, color: FrontHelpers().blanc, size: 10,),
    );
  }
}
