class League {
  var id;
  var name;
  var type;
  var logo;
  var round;

  League({id, name, type, logo,round});

  League.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    logo = json['logo'];
    round = json['round'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id -- $name -- $type -- $logo";
  }
}
