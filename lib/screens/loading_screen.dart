import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String kApiKey = "970b77d7cfa17e8cd6bedbe89500d128";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    // calls get location when LoadingScreen appears
    getLocation();
  }

  void getLocation() async {
    await location.getCurrentLocation();
    //print(location.latitude);
    //print(location.longitude);
  }

  void getData() async {
    // remember to add https:// or http:// to api calls
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey');

    if (response.statusCode == 200) {
      String data = response.body;
      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      print(weatherDescription);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold();
  }
}
