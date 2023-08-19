//import 'package:flutter/material.dart';
import 'package:Ibet/helpers/constants.dart';
import 'package:Ibet/models/event.dart';
import 'package:Ibet/models/fixtures.dart';
import 'package:Ibet/models/league.dart';
import 'package:Ibet/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ApiHelper {
  Future<List<League>> getLeagues() async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    List<League> leagueList = createLeagueList(responseJson['result']);
    return leagueList;
  }

  Future<List<Fixture>> getLiveFixtures() async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    List<Fixture> leagueList = createFixtureList(responseJson['result']);
    return leagueList;
  }

  Future<List<Fixture>> getLastFixtures() async {
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

  Future<Fixture> getFixture(dynamic id) async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football?met=Fixtures&matchId=1299438&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');

    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    Fixture leagueList = Fixture.fromJson(responseJson['result'][0]);

    return leagueList;
  }

  Future<List<Eventt>> getEvent(dynamic id) async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football?met=Fixtures&matchId=1299438&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
    final responseJson = json.decode(res.body);
    List<Eventt> leagueList = createEventtList(responseJson['result'][0]);
    return leagueList;
  }

  Future<List<Characteristique>> getStatistic(dynamic id) async {
    var url = Uri.parse(
        'https://apiv2.allsportsapi.com/football?met=Fixtures&matchId=1299438&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
 
    final responseJson = json.decode(res.body);
    List<Characteristique> leagueList = createCharList(responseJson['result'][0]);

    return leagueList;
  }

  Future<dynamic> getLineups() async {
    var url = Uri.parse('https://apiv3.apifootball.com/?action=get_events&match_id=1299438&APIkey=0f2e7a6b8ab76c4828ff1373762a3f92fe194cf805bc93d49d3da3a18f6d1f13');
    var res = await http.get(url);
    final responseJson = json.decode(res.body);

    List<Characteristique> leagueList = createCharList(responseJson['result'][0]);

    return responseJson[0];
  }

  List<Fixture> createFixtureList(List data) {
    List<Fixture> list = [];
    for (int i = 0; i < data.length; i++) {
      var l = Fixture.fromJson(data[i]);

      list.add(l);
    }

    return list;
  }

  List<Eventt> createEventtList(dynamic data) {
    List tmp = data['goalscorers'];

    List<Eventt> list = [];

    for (int i = 0; i < tmp.length; i++) {
      var l = Eventt.fromJson(tmp[i], data);

      list.add(l);
    }

    tmp = data['cards'];

    for (int i = 0; i < tmp.length; i++) {
      var l = Eventt.fromJson(tmp[i], data);

      list.add(l);
    }

    tmp = data['substitutes'];

    for (int i = 0; i < tmp.length; i++) {
      var l = Eventt.fromJson(tmp[i], data);

      list.add(l);
    }

    return list;
  }

  List<League> createLeagueList(List data) {
    List<League> list = [];
    for (int i = 0; i < data.length; i++) {
      var l = League.fromJson(data[i]);
      list.add(l);
    }

    return list;
  }
}

List<Characteristique> createCharList(dynamic data) {
  List tmp = data['statistics'];
  List<Characteristique> list = [];

  for (int i = 0; i < tmp.length; i++) {
    var l = Characteristique(
        team1: tmp[i]['home'], team2: tmp[i]['away'], title: tmp[i]['type']);
    list.add(l);
  }

  return list;
}
