class Team {
  var id;
  var name;
  var logo;
  bool? winner;

  Team({id, name, logo, winner});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'] ?? false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id -- $name -- $logo";
  }
}
