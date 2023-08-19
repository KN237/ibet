import 'package:Ibet/models/fixtures.dart';
import 'package:Ibet/screens/fixtures.dart';
import 'package:Ibet/screens/standings.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:Ibet/widgets.dart';
import '../helpers/apiHelpers.dart';
import '../models/league.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List WidgetOptions = [Screen1(), Fixtures(), Standings()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: FrontHelpers().blanc,
        domeCircleColor: FrontHelpers().orange,
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: Icon(Icons.home),
          ),
          MoltenTab(
            icon: Icon(Icons.sports_soccer),
          ),
          MoltenTab(
            icon: Icon(Icons.bar_chart),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("LiveScore", style: FrontHelpers().h1),
        centerTitle: true,
        elevation: 0,
        backgroundColor: FrontHelpers().blanc,
      ),
      body: WidgetOptions[_selectedIndex],
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({
    super.key,
  });

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late Future<List<League>> leagues;
  late Future<List<Fixture>> lives;
  late Future<List<Fixture>> last;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leagues = ApiHelper().getLeagues();
    lives = ApiHelper().getLiveFixtures();
    last = ApiHelper().getLastFixtures();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FrontHelpers().blanc,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 20,
                      top: 20,
                      bottom: 10),
                  decoration: BoxDecoration(
                    gradient: FrontHelpers().orangeGradient,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                  ),

                  // DEBUT LISTE DE LEAGUES PAGE PRINCIPALE

                  child: FutureBuilder(
                      future: leagues,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: FrontHelpers().blanc,
                          ));
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return _buildErrorW(snapshot);
                          } else if (snapshot.hasData) {
                            return _buildLeagues(snapshot: snapshot);
                          } else {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.rotate_right,
                                  color: FrontHelpers().blanc,
                                ));
                          }
                        } else {
                          return _buildErrorW(snapshot);
                        }
                      }),
                ),

                // FIN LISTE DE LEAGUES PAGE PRINCIPALE

               // DEBUT TITRE SECTION

                RowTitleWidget(
                  title: " Live fixtures",
                  widget: Image.asset(
                    "assets/images/fr.png",
                    width: 20,
                  ),
                ),

               // FIN TITRE SECTION

                // DEBUT LIVESCORE
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: FutureBuilder(
                      future: lives,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: FrontHelpers().gris,
                          ));
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return _buildError(snapshot);
                          } else if (snapshot.hasData) {
                            return _buildLiveScore(snapshot: snapshot);
                          } else {
                            return _buildError(snapshot);
                          }
                        } else {
                          return _buildError(snapshot);
                        }
                      }),
                ),

                // FIN LIVESCORE

                // DEBUT TITRE SECTION
                RowTitleWidget(
                    title: " Fixtures",
                    widget: Icon(
                      Icons.calendar_month,
                      color: FrontHelpers().gris,
                    )),
                SizedBox(
                  height: 10.0,
                ),

                // FIN TITRE SECTION

                // DEBUT FIXTURES
                Flexible(
                  child: FutureBuilder(
                      future: last,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: FrontHelpers().gris,
                          ));
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return _buildError(snapshot);
                          } else if (snapshot.hasData) {
                            return _buildFixtures(snapshot: snapshot);
                          } else {
                            return _buildError(snapshot);
                          }
                        } else {
                          return _buildError(snapshot);
                        }
                      }),
                )

                // FIN FIXTURES
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildError(AsyncSnapshot<dynamic> snapshot) {
    return GestureDetector(
        onTap: () {
          snapshot.inState(ConnectionState.none);
          setState(() {});
        },
        child: Center(
          child: Icon(
            Icons.rotate_right,
            size: 35,
            color: FrontHelpers().gris,
          ),
        ));
  }

   GestureDetector _buildErrorW(AsyncSnapshot<dynamic> snapshot) {
    return GestureDetector(
        onTap: () {
           snapshot.inState(ConnectionState.none);
          setState(() {});
        },
        child: Center(
          child: Icon(
            Icons.rotate_right,
            size: 35,
            color: FrontHelpers().blanc,
          ),
        ));
  }
}





class _buildLeagues extends StatelessWidget {
  _buildLeagues({
    required this.snapshot,
  });
  AsyncSnapshot<dynamic> snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return LeagueWidget(
            id: snapshot.data[index].id,
            name: snapshot.data[index].name,
            logo: snapshot.data[index].logo,
          );
        });
  }
}

class _buildLiveScore extends StatelessWidget {
  _buildLiveScore({
    required this.snapshot,
  });
  AsyncSnapshot<dynamic> snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return FixtureWidget(
            id: snapshot.data[index].id,
            leagueName: snapshot.data[index].leagueName,
            leagueLogo: snapshot.data[index].leagueLogo,
            homeName: snapshot.data[index].homeName,
            homeLogo: snapshot.data[index].homeLogo,
            homeScore: snapshot.data[index].homeScore,
            awayName: snapshot.data[index].awayName,
            awayLogo: snapshot.data[index].awayLogo,
            awayScore: snapshot.data[index].awayScore,
            status: snapshot.data[index].status,
          );
        });
  }
}

class _buildFixtures extends StatelessWidget {
  _buildFixtures({
    required this.snapshot,
  });
  AsyncSnapshot<dynamic> snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return MatchCard(
            id: snapshot.data[index].id,
            leagueName: snapshot.data[index].leagueName,
            leagueLogo: snapshot.data[index].leagueLogo,
            homeName: snapshot.data[index].homeName,
            homeLogo: snapshot.data[index].homeLogo,
            homeScore: snapshot.data[index].homeScore,
            awayName: snapshot.data[index].awayName,
            awayLogo: snapshot.data[index].awayLogo,
            awayScore: snapshot.data[index].awayScore,
            status: snapshot.data[index].status,
          );
        });
  }
}
