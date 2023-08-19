
import 'package:Ibet/models/event.dart';

class Fixture {
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
  var round;

  Fixture(
      {id,
      leagueName,
      leagueLogo,
      homeName,
      homeScore,
      homeLogo,
      awayName,
      awayScore,
      awayLogo,
      status,
      round});

  Fixture.fromJson(Map<String, dynamic> json) {
    var tmp= json['event_final_result'].replaceAll(' ', '');
    var score = tmp.split('-'); 
    id = json['event_key'];
    leagueName = json['league_name'];
    leagueLogo = json['league_logo'];
    homeName = json['event_home_team'];
    homeScore = score[0];
    homeLogo = json['home_team_logo'];
    awayName = json['event_away_team'];
    awayScore = score[1];
    awayLogo = json['away_team_logo'];
    status = json['event_status'];
    round = json['event_date'] +" "+json['event_time'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id --- $leagueName -- $leagueLogo";
  }
}
