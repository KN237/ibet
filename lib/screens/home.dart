import 'package:Ibet/models/fixtures.dart';
import 'package:Ibet/screens/live.dart';
import 'package:Ibet/screens/premium.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:Ibet/widgets.dart';
import '../models/league.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List WidgetOptions = [Screen1(), Live(), Premium()];

  int _selectedIndex = 0;

  List titres = ["Ibet Pronostics", "Live Pronostics", "Premium Pronostics"];

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
            icon: Icon(Icons.live_tv),
          ),
          MoltenTab(
            icon: Icon(Icons.credit_card),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(titres[_selectedIndex],
            style: FrontHelpers().h1.copyWith(color: FrontHelpers().blanc)),
        actions: [
          GestureDetector(
            onTap: () {
              showAlertDialog(context);
            },
            child: Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: FrontHelpers().gris,
      ),
      body: WidgetOptions[_selectedIndex],
    );
  }
}

class Screen1 extends StatelessWidget {
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
                  margin:
                      EdgeInsets.only(left: 05, top: 10, bottom: 10, right: 05),
                  decoration: BoxDecoration(
                    gradient: FrontHelpers().orangeGradient,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " CURRENT CREDIT BALANCE",
                                style: FrontHelpers().h3.copyWith(
                                    color: FrontHelpers().blanc,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("15.00",
                                  style: FrontHelpers().h1.copyWith(
                                      color: FrontHelpers().blanc,
                                      fontSize: 25)),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.wallet,
                          color: FrontHelpers().blanc,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.6,
                  child: Center(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildFixtures();
                      },
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

class _buildFixtures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MatchCard();
  }
}


showAlertDialog(BuildContext context) { 

   // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel", style: FrontHelpers().h4.copyWith(fontWeight: FontWeight.w400),),
    onPressed:  () {Navigator.of(context).pop(); },
  );
  Widget continueButton = TextButton(
    child: Text("Continue",style: FrontHelpers().h4.copyWith(fontWeight: FontWeight.w400)),
    onPressed:  () {Navigator.of(context).pop(); },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Get Free Credits"),
    content: Text("Do you want to watch ads to make 1 credit ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

 }