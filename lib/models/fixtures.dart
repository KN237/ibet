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
      status,round});

  Fixture.fromJson(Map<String, dynamic> json) {
    var fixture = json['fixture'];
    var league = json['league'];
    var score = json['goals'];
    var status2 = fixture['status'];
    var teams = json['teams'];
    var home = teams['home'];
    var away = teams['away'];

    id = fixture['id'];
    leagueName = league['name']; 
    leagueLogo = league['logo'];
    homeName = home['name'];
    homeScore = score['home'];
    homeLogo = home['logo'];
    awayName = away['name'];
    awayScore = score['home'];
    awayLogo = away['logo'];
    status = status2['long'];
    round = league['round'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id --- $leagueName -- $leagueLogo";
  }
}
