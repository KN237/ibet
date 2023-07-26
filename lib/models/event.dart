class Eventt {
  var time;
  var type;
  var subtype;
  var teamName;
  var teamLogo;
  var playerName;
  var assistName;

  Eventt({time, type, subtype, teamName, teamLogo, playerName, assistName});

  Eventt.fromJson(Map<String, dynamic> json, Map<String, dynamic> json2) {
    if (json['score']!=null) {
      time = json['time'];
      type = "Goal";
      subtype = json['score_info_time'];
      teamName = json['home_scorer'] != ""
          ? json2['match_hometeam_name']
          : json2['match_awayteam_name'];
      teamLogo = json['home_scorer'] != ""
          ? json2['team_home_badge']
          : json2['team_away_badge'];
      playerName = json['home_scorer'] ?? json['away_scorer'];
      assistName = json['home_assist'] ?? json['away_assist'];
    } else if (json['card']!=null) {
      time = json['time'];
      type = json['card'];
      subtype = json['score_info_time'];
      teamName = json['home_fault'] != ""
          ? json2['match_hometeam_name']
          : json2['match_awayteam_name'];
      teamLogo = json['home_fault'] != ""
          ? json2['team_home_badge']
          : json2['team_away_badge'];
      playerName = json['home_fault'] ?? json['away_fault'];
      assistName = " ";
    } else {
      time = json['time'];
      type = "substitution";
      subtype = " ";
      teamName = json2['league_name'];
      teamLogo = json2['league_logo'];

      var tmp = json['substitution'].split('|');
      playerName = tmp[0];
      assistName = tmp[1];
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$time -- $type -- $subtype-- $teamName -- $playerName";
  }
}
