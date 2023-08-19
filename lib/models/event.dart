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
    if (json['score']!=null && json['score']!="substitution" ) {
      time = json['time'];
      type = "Goal";
      subtype = json['info'];
      teamName = json['home_scorer'] != ""
          ? json2['event_home_team']
          : json2['event_away_team'];
      teamLogo = json['home_scorer'] != ""
          ? json2['home_team_logo']
          : json2['away_team_logo'];
      playerName = json['home_scorer'] ?? json['away_scorer'];
      assistName = json['home_assist'] ?? json['away_assist'];
    } 
    
    if (json['card']!=null) {
      time = json['time'];
      type = json['card'];
      subtype = json['info_time'];
      teamName = json['home_fault'] != ""
          ? json2['event_home_team']
          : json2['event_away_team'];
      teamLogo = json['home_fault'] != ""
          ? json2['home_team_logo']
          : json2['away_team_logo'];
      playerName = json['home_fault'] ?? json['away_fault'];
      assistName = " ";
    } 
    
    if (json['score']!=null && json['score']=="substitution") {
      time = json['time'];
      type = "substitution";
      subtype = " ";
      teamName = json2['league_name'];
      teamLogo = json2['league_logo'];

      var tmp = json['home_scorer'] is List ? json['away_scorer'] as Map : json['home_scorer'] as Map;
      playerName = tmp['out'];
      assistName = tmp['in'];
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$time -- $type -- $subtype-- $teamName -- $playerName";
  }
}
