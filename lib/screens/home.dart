import 'package:Ibet/screens/fixtures.dart';
import 'package:Ibet/screens/standings.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:Ibet/widgets.dart';

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

class Screen1 extends StatelessWidget {
  const Screen1({
    super.key,
  });

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
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    LeagueWidget(
                      image: 'league1.png',
                    ),
                    LeagueWidget(image: 'league2.png'),
                    LeagueWidget(image: 'league3.png'),
                    LeagueWidget(image: 'league4.png'),
                    LeagueWidget(image: 'league5.png'),
                  ]),
                ),
                RowTitleWidget(
                  title: " Live fixtures",
                  widget: Image.asset(
                    "assets/images/fr.png",
                    width: 20,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    FixtureWidget(),
                    FixtureWidget(),
                    FixtureWidget(),
                    FixtureWidget(),
                  ]),
                ),
                RowTitleWidget(
                    title: " Fixtures", widget: Icon(Icons.calendar_month, color: FrontHelpers().gris,)),
                SizedBox(
                  height: 10.0,
                ),
                MatchCard(
                  status: true,
                ),
                MatchCard(
                  status: false,
                ),
                MatchCard(
                  status: true,
                ),
                MatchCard(
                  status: true,
                ),
                MatchCard(
                  status: false,
                ),
                MatchCard(
                  status: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
