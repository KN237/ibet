class League {
  var id;
  var name;
  var type;
  var logo;

  League({id, name, type, logo});

  League.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    logo = json['logo'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id -- $name -- $type -- $logo";
  }
}
