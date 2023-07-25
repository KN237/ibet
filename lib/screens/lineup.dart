import 'package:Ibet/helpers/apiHelpers.dart';
import 'package:flutter/material.dart';
import '../helpers/frontHelpers.dart';

int index1 = 1;
int index2 = 1;

class Lineup extends StatefulWidget {
  const Lineup({super.key});

  @override
  State<Lineup> createState() => _LineupState();
}

class _LineupState extends State<Lineup> {
  late Future<dynamic> lineups;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lineups = ApiHelper().getLineups();
  }

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
        title: Text("LineUp",style: FrontHelpers().h4,),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pitch.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
            future: lineups,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: FrontHelpers().blanc,
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List players =
                      fromString(snapshot.data["match_hometeam_system"]);
                  List players2 =
                      fromString(snapshot.data["match_awayteam_system"]);
                  final size = MediaQuery.of(context).size.height /
                      ((players.length + 1)*2.5);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: players.length + 1,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                height: size,
                                child: _child(
                                    index,
                                    players,
                                    1,
                                    snapshot.data["lineup"]["home"]
                                        ["starting_lineups"]));
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: players2.length + 1,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                height: size,
                                child: _child2(
                                    index,
                                    players2,
                                    2,
                                    snapshot.data["lineup"]["away"]
                                        ["starting_lineups"]));
                          },
                        ),
                      ),
                    ],
                  );
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
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ),
    );
  }
}

List fromString(String str) {
  List tmp = [];
  List tmp2 = [];
  if (str.length < 7) {
    str = "$str-0";
  }

  tmp = str.split('-');

  for (var i = 0; i < tmp.length; i++) {
    tmp2.add(int.parse(tmp[i]));
  }

  return tmp2;
}

Widget _child(int index, List d, var img, List<dynamic> players) {
  // goalkie
  if (index == 0) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.topCenter,
          child: _playerImg('assets/images/placeholder$img.png', players[0])),
    );
  }
  // formated players
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(
      d[index - 1],
      (index) {
        var tmp = players[index1];
        index1++;
        return _playerImg('assets/images/placeholder$img.png', tmp);
      },
    ),
  );
}

Widget _child2(int index, List d, var img, List<dynamic> players) {
  // goalkie
  if (index == 0) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.topCenter,
          child: _playerImg('assets/images/placeholder$img.png', players[0])),
    );
  }
  // formated players
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(
      d[index - 1],
      (index) {
        var tmp = players[index2];
        index2++;
        return _playerImg('assets/images/placeholder$img.png', tmp);
      },
    ),
  );
}

Widget _playerImg(String img, Map<String, dynamic> player) => Column(
      children: [
        Text(
          player['lineup_player'],
          style: FrontHelpers().bodyText.copyWith(color: FrontHelpers().blanc),
        ),
        CircleAvatar(radius: 15, backgroundImage: AssetImage(img)),
      ],
    );
