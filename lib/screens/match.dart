import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Match extends StatelessWidget {
  const Match({super.key});

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
      body: Container(
        color: FrontHelpers().blanc,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    gradient: FrontHelpers().rougeGradient,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (2*MediaQuery.of(context).size.height) / 3,
                  decoration: BoxDecoration(
                    color: FrontHelpers().rouge.withOpacity(0.8),
                  ),
                  child: ContainedTabBarView(
                    tabBarProperties:
                        TabBarProperties(indicatorColor: FrontHelpers().rouge),
                    tabs: [Text('Statistics'), Text('Lineups'), Text("Events")],
                    views: [
                      Container(
                        color: FrontHelpers().blanc,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.0
                            ),
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
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(color: Colors.green),
                      Container(color: Colors.blue)
                    ],
                    onChange: (index) => print(index),
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
