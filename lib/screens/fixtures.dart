import 'package:Ibet/models/fixtures.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:Ibet/widgets.dart';
import '../helpers/apiHelpers.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  late Future<List<Fixture>> last;
  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    last = ApiHelper().getLastFixtures();
  }
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
                SizedBox(
                  height: 20.0,
                ),

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
                            return const Text('Error');
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length == null
                                    ? 0
                                    : snapshot.data.length,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}