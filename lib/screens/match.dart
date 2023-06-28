import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Match extends StatelessWidget {
  Match({super.key});
  List<Widget> event = [
    FixtureEvent(),
    FixtureEvent(),
    FixtureEvent(),
    FixtureEvent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: FrontHelpers().noir,
              size: 15,
            )),
        elevation: 0,
        backgroundColor: FrontHelpers().blanc,
        title: Text(
          "Bayern Munich VS FC Barcelone",
          style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: event.length * 100 + MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    gradient: FrontHelpers().orangeGradient,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/league1.png",
                              width: 20,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Premiere League",
                              style: FrontHelpers()
                                  .h2
                                  .copyWith(color: FrontHelpers().blanc),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/bayern.png",
                                width: 80,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Bayern Munich",
                                style: FrontHelpers().bodyText.copyWith(
                                    color: FrontHelpers().blanc,
                                    fontFamily: "Nexa"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0 : 2",
                                style: FrontHelpers().h1.copyWith(
                                    fontSize: 40, color: FrontHelpers().blanc),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Regular season - 4",
                                style: FrontHelpers().bodyText.copyWith(
                                    color: FrontHelpers().blanc,
                                    fontFamily: "Nexa"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/fcb.png",
                                width: 80,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "FC Barcelone",
                                style: FrontHelpers().bodyText.copyWith(
                                    color: FrontHelpers().blanc,
                                    fontFamily: "Nexa"),
                              )
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: FrontHelpers().blanc.withOpacity(0.1),
                          ),
                          child: Center(
                              child: Text(
                            "Match terminated",
                            style: FrontHelpers().h4.copyWith(
                                color: FrontHelpers().blanc,
                                fontFamily: "Nexa"),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FrontHelpers().gris.withOpacity(0.8),
                    ),
                    child: ContainedTabBarView(
                      tabBarProperties: TabBarProperties(
                          indicatorColor: FrontHelpers().gris),
                      tabs: [
                        Text('Statistics'),
                        Text('Lineups'),
                        Text("Events")
                      ],
                      views: [
                        Container(
                          color: FrontHelpers().blanc,
                          child: Column(children: [
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/bayern.png",
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text("Bayern Munich"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
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
                              ],
                            ),
                            Characteristique(
                              team1: "12",
                              team2: "2",
                              title: "Shots on Goals",
                            ),
                            Characteristique(
                              team1: "12",
                              team2: "2",
                              title: "Shots of Goals",
                            ),
                          ]),
                        ),
                        Container(
                          height: 10,
                          color: FrontHelpers().blanc,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Available soon",
                                  style: FrontHelpers().h3.copyWith(
                                      color: FrontHelpers().gris,
                                      fontFamily: "Nexa"),
                                )),
                          ),
                        ),
                        Container(
                          color: FrontHelpers().blanc,
                          child: Column(
                            children: event,
                          ),
                        ),
                      ],
                      onChange: (index) => print(index),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Characteristique extends StatelessWidget {
  Characteristique({
    required this.team1,
    required this.team2,
    required this.title,
  });

  String team1;
  String team2;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(team1),
          SizedBox(
            width: 05,
          ),
          Text(title),
          SizedBox(
            width: 05,
          ),
          Text(team2),
        ],
      ),
    );
  }
}

class FixtureEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 03.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 20),
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text("Goal"),
                          SizedBox(
                            height: 15,
                          ),
                          Text("L. Diaz"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 9,
                  child: Column(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: FrontHelpers().rouge),
                        child: Center(
                          child: Text(
                            "12",
                            style: FrontHelpers()
                                .bodyText
                                .copyWith(color: FrontHelpers().blanc),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Icon(Icons.sports_soccer),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Normal Goal"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Assist: Firmino"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
