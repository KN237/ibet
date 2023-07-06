import 'package:Ibet/screens/match.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

class LeagueRoundedCard extends StatelessWidget {
  const LeagueRoundedCard({
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          gradient: FrontHelpers().orangeGradient,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/${image}",
            width: 25,
          ),
          Text(
            name,
            style: FrontHelpers()
                .h4
                .copyWith(color: FrontHelpers().blanc, fontFamily: "Nexa"),
          )
        ],
      ),
    );
  }
}

class LeagueWidget extends StatelessWidget {
  const LeagueWidget({
    required this.id,
    required this.name,
    required this.logo,
  });
  final int id;
  final String name;
  final String logo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08.0),
      child: CircleAvatar(
        child: Image.network(logo, width: 50, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(Icons.hide_image, color: FrontHelpers().gris);
        }),
        backgroundColor: FrontHelpers().blanc,
        radius: 40,
      ),
    );
  }
}

class FixtureWidget extends StatelessWidget {
  FixtureWidget(
      {super.key,
      this.id,
      this.leagueName,
      this.leagueLogo,
      this.homeName,
      this.homeScore,
      this.homeLogo,
      this.awayName,
      this.awayScore,
      this.awayLogo,
      this.status});
  var id;
  var leagueName;
  var leagueLogo;
  var homeName;
  var homeLogo;
  var homeScore;
  var awayName;
  var awayLogo;
  var awayScore;
  var status;
  // var r = Random();
  // late int tmp = r.nextInt(3);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20, top: 10.0),
      child: Row(
        children: [
          Container(
            height: 200,
            width: 150,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
                gradient: FrontHelpers().grisGradient,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: Center(
                    child: Text(leagueName,
                        style: FrontHelpers().bodyText.copyWith(
                            color: FrontHelpers().blanc, fontFamily: "Nexa"),
                        textAlign: TextAlign.center,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.clip),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(homeLogo, width: 50, errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                      return Icon(Icons.hide_image, color: FrontHelpers().gris);
                    }),
                    Image.network(awayLogo, width: 50, errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                      return Icon(Icons.hide_image, color: FrontHelpers().gris);
                    }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                child: Text(homeName,
                                    style: FrontHelpers().bodyText.copyWith(
                                        color: FrontHelpers().blanc,
                                        fontFamily: "Nexa"),
                                    softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade),
                              ),
                              Container(
                                width: 70,
                                child: Text(awayName,
                                    style: FrontHelpers().bodyText.copyWith(
                                        color: FrontHelpers().blanc,
                                        fontFamily: "Nexa"),
                                    softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              Text(homeScore.toString() ?? '0',
                                  style: FrontHelpers()
                                      .bodyText
                                      .copyWith(color: FrontHelpers().blanc)),
                              Text(awayScore.toString() ?? '0',
                                  style: FrontHelpers()
                                      .bodyText
                                      .copyWith(color: FrontHelpers().blanc))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: FrontHelpers().blanc,
                    ),
                    child: Center(
                        child: Text(
                      status,
                      style: FrontHelpers()
                          .bodyText
                          .copyWith(color: FrontHelpers().gris),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  MatchCard(
      {super.key,
      this.id,
      this.leagueName,
      this.leagueLogo,
      this.homeName,
      this.homeScore,
      this.homeLogo,
      this.awayName,
      this.awayScore,
      this.awayLogo,
      this.status});
  var id;
  var leagueName;
  var leagueLogo;
  var homeName;
  var homeLogo;
  var homeScore;
  var awayName;
  var awayLogo;
  var awayScore;
  var status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Match(id: id);
        }));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 03.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width / 20),
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(homeLogo, width: 40.0, errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                      return Icon(Icons.hide_image, color: FrontHelpers().gris);
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        homeName,
                        style: FrontHelpers()
                            .bodyText
                            .copyWith(fontFamily: "Nexa"),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " ${homeScore ?? '0'} : ${awayScore ?? '0'} ",
                        style: FrontHelpers()
                            .h1
                            .copyWith(color: FrontHelpers().orange),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          leagueName,
                          style: FrontHelpers()
                              .bodyText
                              .copyWith(fontFamily: "Nexa"),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: FrontHelpers().gris,
                        ),
                        child: Center(
                            child: Text(
                          status,
                          style: FrontHelpers()
                              .bodyText
                              .copyWith(color: FrontHelpers().blanc),
                        )),
                      ),
                      SizedBox(
                        height: 01,
                      ),
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(awayLogo, width: 40.0, errorBuilder:
                        (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                      return Icon(Icons.hide_image, color: FrontHelpers().gris);
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      awayName,
                      style:
                          FrontHelpers().bodyText.copyWith(fontFamily: "Nexa"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowTitleWidget extends StatelessWidget {
  RowTitleWidget({required this.title, required this.widget});
  String title;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20, right: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.ideographic,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Image.asset(
              //   "assets/images/fr.png",
              //   width: 20,
              // ),
              widget,
              Text(
                title,
                style: FrontHelpers().h2,
              ),
            ],
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return Match();
          //     }));
          //   },
          //   child: Row(
          //     textBaseline: TextBaseline.alphabetic,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "View all",
          //         style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
          //       ),
          //       SizedBox(
          //         width: 03,
          //       ),
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         size: FrontHelpers().h2.fontSize,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
