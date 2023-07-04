//import 'package:flutter/material.dart';
import 'package:Ibet/helpers/constants.dart';
import 'package:Ibet/models/fixtures.dart';
import 'package:Ibet/models/league.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiHelper {
  Future<List<League>> getLeagues() async {
    var url =
        Uri.parse('https://v3.football.api-sports.io/leagues?current=true');
    var res = await http.get(url,
        headers: {'x-apisports-key': 'efa9310906b47656da968f6804d26a70'});
    final responseJson = json.decode(res.body);
    List<League> leagueList = createLeagueList(responseJson["response"]);
    return leagueList;
  }

  Future<List<Fixture>> getLiveFixtures() async {
    var url = Uri.parse('https://v3.football.api-sports.io/fixtures?live=all');
    var res = await http.get(url,
        headers: {'x-apisports-key': 'efa9310906b47656da968f6804d26a70'});
    final responseJson = json.decode(res.body);
    List<Fixture> leagueList = createFixtureList(responseJson["response"]);
    return leagueList;
  }

  List<Fixture> createFixtureList(List data) {
    List<Fixture> list = [];
    for (int i = 0; i < data.length; i++) {

      print(" ooooh ${data[i]['fixture']['id']}");

      var l = Fixture.fromJson(data[i]);
       
      list.add(l);
    }

    return list;
  }

  List<League> createLeagueList(List data) {
    List<League> list = [];
    for (int i = 0; i < data.length; i++) {
      var l = League.fromJson(data[i]["league"]);
      list.add(l);
    }

    return list;
  }
}
