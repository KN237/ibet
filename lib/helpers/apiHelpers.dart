//import 'package:flutter/material.dart';
import 'package:Ibet/helpers/constants.dart';
import 'package:Ibet/models/fixtures.dart';
import 'package:Ibet/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ApiHelper {
  Future<List<Fixture>> getLiveOdds() async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    List<Fixture> leagueList = createFixtureList(responseJson['result']);
    return leagueList;
  }

  Future<List<Fixture>> getFixtures() async {
    var now = new DateTime.now();
    var today = now.subtract(const Duration(days: 1));
    final fifteenDaysAgo = now.subtract(const Duration(days: 5));
    var formatter = new DateFormat('yyyy-MM-dd');
    String nowFormattedDate = formatter.format(today);
    String fifteenDaysAgoFormattedDate = formatter.format(fifteenDaysAgo);
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football?met=Fixtures&from=$fifteenDaysAgoFormattedDate&to=$nowFormattedDate&league_id=152&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');

    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    List<Fixture> leagueList = createFixtureList(responseJson['result']);
    return leagueList;
  }

   Future<Fixture> getOdds(dynamic id) async {
    id=1299438;
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football/?&met=Odds&matchId=$id&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');

    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    Fixture leagueList = Fixture.fromJson(responseJson['result']["$id"]);

    return leagueList;
  }

  List<Fixture> createFixtureList(List data) {
    List<Fixture> list = [];
    for (int i = 0; i < data.length; i++) {
      var l = Fixture.fromJson(data[i]);

      list.add(l);
    }

    return list;
  }
}
