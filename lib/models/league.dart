class League {
  var id;
  var name;
  var logo;
  var season;

  League({id, name,logo});

  League.fromJson(Map<String, dynamic> json) {
    name = json['league_name'];
    id = json['league_key'];
    logo = json['league_logo'];
    // season = json['league_season'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id -- $name  -- $logo";
  }
}
