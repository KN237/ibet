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
                    LeagueRoundedCard(image: "league1.png", name: " League 1"),
                    LeagueRoundedCard(image: "league2.png", name: " League 2"),
                    LeagueRoundedCard(image: "league3.png", name: " League 3"),
                    LeagueRoundedCard(image: "league4.png", name: " League 4"),
                    LeagueRoundedCard(image: "league5.png", name: " League 5"),
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
                        Standing0(),
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

class Standing0 extends StatelessWidget {
  const Standing0({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 190,
          padding: const EdgeInsets.only(left: 10, top: 15, right: 100.0),
          child: Center(child: Text("Team Name")),
        ),
        Row(
          children: [
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("PL"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("W"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("D"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("L"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("GF"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("GA"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("GD"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("Pts"),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              width: 150,
              child: Center(child: Text("FORM")),
            ),
          ],
        ),
      ],
    );
  }
}

class Standing extends StatelessWidget {
  const Standing({
    super.key,
  });

  String truncate(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          margin: const EdgeInsets.only(
            left: 10,
            top: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Text(truncate(15, "FC Barcelone")) ,
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Align(alignment: Alignment.centerLeft, child: Text("04")),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text("04"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MatchStateWidget(
                    status: 0,
                  ),
                  MatchStateWidget(
                    status: 1,
                  ),
                  MatchStateWidget(
                    status: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MatchStateWidget extends StatelessWidget {
  MatchStateWidget({required this.status // 0 perdu 1 gagné 2 null
      });
  final int status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        backgroundColor: status == 0
            ? FrontHelpers().rouge
            : status == 1
                ? FrontHelpers().vert
                : FrontHelpers().gris,
        radius: 10,
        child: Icon(
          status == 0
              ? Icons.close
              : status == 1
                  ? Icons.check
                  : Icons.remove,
          color: FrontHelpers().blanc,
          size: 10,
        ),
      ),
    );
  }
}
