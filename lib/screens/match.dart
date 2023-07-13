import 'package:Ibet/helpers/apiHelpers.dart';
import 'package:Ibet/models/event.dart';
import 'package:Ibet/models/fixtures.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Match extends StatefulWidget {
  Match({this.id});
  var id;
  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  late Future<Fixture> match;
  late Future<List<Eventt>> events;
  var appBarText;
  List<Widget> event = [
    FixtureEvent(),
    FixtureEvent(),
    FixtureEvent(),
    FixtureEvent(),
  ];
  Widget getEventWidget(List<Eventt> l) {
    List<Widget> w = [];
    for (var i = 0; i < l.length; i++) {
      w.add(FixtureEvent(
        teamLogo: l[i].teamLogo,
        teamName: l[i].teamName,
        time: l[i].time,
        eventType: l[i].type,
        eventSubType: l[i].subtype,
        playerName: l[i].playerName,
        assistName: l[i].assistName,
      ));
    }

    return Column(
      children: w,
    );
  }

  void getAppBarText() async {
    Fixture newMatch = await ApiHelper().getFixture(widget.id);
    appBarText = "${newMatch.homeName} VS ${newMatch.awayName}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    match = ApiHelper().getFixture(widget.id);
    events = ApiHelper().getEvent(widget.id);
    getAppBarText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: FutureBuilder(
            future: match,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  '...',
                  style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print(snapshot.data);
                  return Center(child: Text('Error'));
                } else if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data.homeName} VS ${snapshot.data.awayName}",
                    style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
                  );
                } else {
                  return GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Icon(
                        Icons.rotate_right,
                        color: FrontHelpers().gris,
                      ));
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: event.length * 350 + MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: match,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(
                          color: FrontHelpers().gris,
                        ),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return Column(
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
                                      Image.network(snapshot.data.leagueLogo,
                                          width: 20, errorBuilder:
                                              (BuildContext context,
                                                  Object exception,
                                                  StackTrace? stackTrace) {
                                        return Icon(Icons.hide_image,
                                            color: FrontHelpers().gris);
                                      }),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        snapshot.data.leagueName,
                                        style: FrontHelpers().h2.copyWith(
                                            color: FrontHelpers().blanc),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(snapshot.data.homeLogo,
                                            width: 80, errorBuilder:
                                                (BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                          return Icon(Icons.hide_image,
                                              color: FrontHelpers().gris);
                                        }),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            snapshot.data.homeName,
                                            style: FrontHelpers()
                                                .bodyText
                                                .copyWith(
                                                    color: FrontHelpers().blanc,
                                                    fontFamily: "Nexa"),
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${snapshot.data.homeScore ?? '0'} : ${snapshot.data.awayScore ?? '0'}",
                                          style: FrontHelpers().h1.copyWith(
                                              fontSize: 40,
                                              color: FrontHelpers().blanc),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          snapshot.data.round,
                                          style: FrontHelpers()
                                              .bodyText
                                              .copyWith(
                                                  color: FrontHelpers().blanc,
                                                  fontFamily: "Nexa"),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.network(snapshot.data.awayLogo,
                                            width: 80, errorBuilder:
                                                (BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                          return Icon(Icons.hide_image,
                                              color: FrontHelpers().gris);
                                        }),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            snapshot.data.awayName,
                                            style: FrontHelpers()
                                                .bodyText
                                                .copyWith(
                                                    color: FrontHelpers().blanc,
                                                    fontFamily: "Nexa"),
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color:
                                          FrontHelpers().blanc.withOpacity(0.1),
                                    ),
                                    child: Center(
                                        child: Text(
                                      snapshot.data.status,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                    snapshot.data.homeLogo,
                                                    width: 15, errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                  return Icon(Icons.hide_image,
                                                      color:
                                                          FrontHelpers().gris);
                                                }),
                                                SizedBox(
                                                  width: 05,
                                                ),
                                                Text(snapshot.data.homeName),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                    snapshot.data.awayLogo,
                                                    width: 15, errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                  return Icon(Icons.hide_image,
                                                      color:
                                                          FrontHelpers().gris);
                                                }),
                                                SizedBox(
                                                  width: 05,
                                                ),
                                                Text(snapshot.data.awayName),
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
                                    child: FutureBuilder(
                                        future: events,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<dynamic> snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child: CircularProgressIndicator(color: FrontHelpers().gris,),
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return Container(
                                                height: 10,
                                                color: FrontHelpers().blanc,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        "There was an error ! Please try again later.",
                                                        style: FrontHelpers()
                                                            .h3
                                                            .copyWith(
                                                                color:
                                                                    FrontHelpers()
                                                                        .gris,
                                                                fontFamily:
                                                                    "Nexa"),
                                                      )),
                                                ),
                                              );
                                            } else if (snapshot.hasData) {
                                              return getEventWidget(
                                                  snapshot.data);
                                            } else {
                                              return Container(
                                                height: 10,
                                                color: FrontHelpers().blanc,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        "There's nothing to display now !",
                                                        style: FrontHelpers()
                                                            .h3
                                                            .copyWith(
                                                                color:
                                                                    FrontHelpers()
                                                                        .gris,
                                                                fontFamily:
                                                                    "Nexa"),
                                                      )),
                                                ),
                                              );
                                            }
                                          } else {
                                            return Text(
                                                'State: ${snapshot.connectionState}',style: FrontHelpers()
                                                            .h3
                                                            .copyWith(
                                                                color:
                                                                    FrontHelpers()
                                                                        .gris,
                                                                fontFamily:
                                                                    "Nexa"));
                                          }
                                        }),
                                  ),
                                ],
                                onChange: (index) => print(index),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Icon(
                            Icons.rotate_right,
                            color: FrontHelpers().gris,
                          ));
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                }),
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
  FixtureEvent(
      {this.teamLogo,
      this.teamName,
      this.playerName,
      this.eventType,
      this.eventSubType,
      this.time,
      this.assistName});

  var teamLogo;
  var teamName;
  var playerName;
  var eventType;
  var eventSubType;
  var time;
  var assistName;

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
                Image.network(teamLogo, width: 15, errorBuilder:
                    (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return Icon(Icons.hide_image, color: FrontHelpers().gris);
                }),
                SizedBox(
                  width: 05,
                ),
                Text(teamName),
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
                          Text(eventType),
                          SizedBox(
                            height: 15,
                          ),
                          Text(playerName),
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
                            time.toString(),
                            style: FrontHelpers()
                                .bodyText
                                .copyWith(color: FrontHelpers().blanc),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      eventSubType.toString().contains('ellow')
                          ? Icon(
                              Icons.style,
                              color: Colors.yellow,
                            )
                          : eventSubType.toString().contains('ed')
                              ? Icon(Icons.style, color: Colors.red)
                              : eventSubType.toString().contains('ub')
                                  ? Icon(Icons.change_circle,)
                                  : Icon(Icons.sports_soccer),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(eventSubType),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Assist: $assistName"),
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
