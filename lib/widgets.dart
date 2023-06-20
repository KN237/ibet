
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';


class LeagueRoundedCard extends StatelessWidget {
  const LeagueRoundedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        gradient: FrontHelpers().rougeGradient,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/league1.png",
            width: 25,
          ),
          Text(
            "Champions League",
            style: FrontHelpers().h4.copyWith(
                color: FrontHelpers().blanc,
                fontFamily: "Nexa"),
          )
        ],
      ),
    );
  }}


class LeagueWidget extends StatelessWidget {
  const LeagueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08.0),
      child: CircleAvatar(
        child: Image.asset(
          "assets/images/league4.png",
          width: 50,
        ),
        backgroundColor: FrontHelpers().blanc,
        radius: 40,
      ),
    );
  }
}

class FixtureWidget extends StatelessWidget {
  const FixtureWidget({
    super.key,
  });

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
                gradient: FrontHelpers().rougeGradient,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "Liga",
                    style: FrontHelpers().h4.copyWith(
                        color: FrontHelpers().blanc, fontFamily: "Nexa"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/fcb.png",
                      width: 50,
                    ),
                    Image.asset(
                      "assets/images/bayern.png",
                      width: 50,
                    ),
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
                              Text(
                                "FC Barcelona",
                                style: FrontHelpers().h4.copyWith(
                                    color: FrontHelpers().blanc,
                                    fontFamily: "Nexa"),
                              ),
                              Text("Bayern",
                                  style: FrontHelpers().h4.copyWith(
                                      color: FrontHelpers().blanc,
                                      fontFamily: "Nexa"))
                            ],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              Text("0",
                                  style: FrontHelpers()
                                      .h4
                                      .copyWith(color: FrontHelpers().blanc)),
                              Text("0",
                                  style: FrontHelpers()
                                      .h4
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
                    width: MediaQuery.of(context).size.width / 8,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: FrontHelpers().blanc,
                    ),
                    child: Center(
                        child: Text(
                      "Live",
                      style: FrontHelpers()
                          .h4
                          .copyWith(color: FrontHelpers().rouge),
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
  const MatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 03.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 20),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/fcb.png",
                  width: 40.0,
                ),
                Text(
                  " Fc Barcelone",
                  style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
                )
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " 0 : 1 ",
                    style: FrontHelpers()
                        .h1
                        .copyWith(color: FrontHelpers().orange),
                  ),
                  Text(
                    "Premiere League",
                    style: FrontHelpers().bodyText.copyWith(fontFamily: "Nexa"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: FrontHelpers().rouge,
                    ),
                    child: Center(
                        child: Text(
                      "Live",
                      style: FrontHelpers()
                          .h4
                          .copyWith(color: FrontHelpers().blanc),
                    )),
                  ),
                  SizedBox(
                    height: 01,
                  ),
                ]),
                SizedBox(),
                SizedBox(),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/bayern.png",
                  width: 40.0,
                ),
                Text(
                  "Bayern",
                  style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RowTitleWidget extends StatelessWidget {
  const RowTitleWidget({
    super.key,
  });

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
              Image.asset(
                "assets/images/fr.png",
                width: 20,
              ),
              Text(
                " Live Fixtures",
                style: FrontHelpers().h2,
              ),
            ],
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "View all",
                style: FrontHelpers().h3.copyWith(fontFamily: "Nexa"),
              ),
              SizedBox(
                width: 03,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: FrontHelpers().h2.fontSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
