import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'dart:math';

class MatchCard extends StatelessWidget {
  MatchCard({
    this.isPremium,
  });
  bool? isPremium;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 03.0),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 98) / 100,
        height: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/images/fcb.png", width: 40.0,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        return Icon(Icons.hide_image,
                            color: FrontHelpers().gris);
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        child: Center(
                          child: Text(
                            "homeName",
                            style: FrontHelpers()
                                .bodyText
                                .copyWith(fontFamily: "Nexa"),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 05,
                        ),
                        Container(
                          width: 100,
                          child: Center(
                            child: Column(
                              children: [
                                isPremium == true
                                    ? Image.asset(
                                        "assets/images/crown.png",
                                        width: 20,
                                      )
                                    : SizedBox( height: 05,),
                                Text(
                                  "leagueName",
                                  style: FrontHelpers()
                                      .bodyText
                                      .copyWith(fontFamily: "Nexa"),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                          ),
                        ),
                        isPremium == true
                            ? SizedBox(height: 20,)
                            : SizedBox(height: 30,),
                        Column(
                          children: [
                            Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  "DateTime",
                                  style: FrontHelpers()
                                      .bodyText
                                      .copyWith(fontFamily: "Nexa"),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
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
                                "status",
                                style: FrontHelpers()
                                    .bodyText
                                    .copyWith(color: FrontHelpers().blanc),
                              )),
                            ),
                          ],
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
                      Image.asset("assets/images/fcb.png", width: 40.0,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        return Icon(Icons.hide_image,
                            color: FrontHelpers().gris);
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        child: Center(
                          child: Text(
                            "awayName",
                            style: FrontHelpers()
                                .bodyText
                                .copyWith(fontFamily: "Nexa"),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: FrontHelpers().gris,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "1",
                    style:
                        FrontHelpers().h3.copyWith(color: FrontHelpers().blanc),
                  ),
                  Text(
                    "X",
                    style:
                        FrontHelpers().h3.copyWith(color: FrontHelpers().blanc),
                  ),
                  Text(
                    "1",
                    style:
                        FrontHelpers().h3.copyWith(color: FrontHelpers().blanc),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
