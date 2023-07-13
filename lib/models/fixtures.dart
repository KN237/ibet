
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
    id = json['match_id'];
    leagueName = json['league_name'];
    leagueLogo = json['league_logo'];
    homeName = json['match_hometeam_name'];
    homeScore = json['match_hometeam_score'];
    homeLogo = json['team_home_badge'];
    awayName = json['match_awayteam_name'];
    awayScore = json['match_awayteam_score'];
    awayLogo = json['team_away_badge'];
    status = json['match_status'];
    round = json['match_date'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id --- $leagueName -- $leagueLogo";
  }
}
