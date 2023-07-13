class Eventt{
  var time;
  var type;
  var subtype;
  var teamName;
  var teamLogo;
  var playerName;
  var assistName;

  Eventt({time, type, subtype, teamName,teamLogo,playerName,assistName});

  Eventt.fromJson(Map<String, dynamic> json,Map<String, dynamic> json2) {

    time = json['time'];
    type=json['type'];
    subtype=json['detail'];
    teamName= json['team']['name'];
    teamLogo= json['team']['logo'];
    playerName = json['home_scorer'] ?? json['away_scorer'];
    assistName = json['home_assist'] ?? json['away_assist'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$time -- $teamName -- $playerName";
  }
}
