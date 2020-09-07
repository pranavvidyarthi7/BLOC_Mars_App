import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mar_rover/PageResizing/Variables.dart';
import 'package:mar_rover/PageResizing/WidgetResizing.dart';
import 'package:http/http.dart' as http;
import 'package:mar_rover/screens/welcome_screen.dart';

int _i;

class MainPage extends StatelessWidget {
  final String roverName;
  MainPage(this.roverName);
  Widget buildList() {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: getImages(index), // <--- get a future
          builder: (BuildContext context, snapshot) {
            // <--- build the things.
            return snapshot.hasData
                ? snapshot.data
                : Container(
                    height: 80.0,
                    child: Text('loading..'),
                  );
          },
        );
      },
    );
  }

  static const String id = 'MainPage';

  Future<Widget> getImages(int i) async {
    final res1 = await http.get(
        'https://api.nasa.gov/mars-photos/api/v1/manifests/$roverName?api_key=Wt4YzlVLV9JQ4HDEJ0UbOEiWM9wNrjj23TJxwVq9');
    final int maxSol = (jsonDecode(res1.body))['photo_manifest']['max_sol'];

    final res = await http.get(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/$roverName/photos?sol=${maxSol - i}&api_key=Wt4YzlVLV9JQ4HDEJ0UbOEiWM9wNrjj23TJxwVq9');
    // print(res.body);
    // if ((jsonDecode(res.body))['photos'] == null) {
    //   _i++;
    //   getImages(_i);
    // }

    final url = (jsonDecode(res.body))['photos'][0]['img_src'];
    final date = (jsonDecode(res.body))['photos'][0]['earth_date'];
    final sol = maxSol - i;
    print(sol);
    print(date);
    // _i = _i + (1);
    return Images(
      date: date,
      url: url,
      sol: sol,
    );
  }

  @override
  Widget build(BuildContext context) {
    // _i = 0;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 84 * boxSizeV,
                child: buildList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  final url;
  final date;
  final sol;
  const Images({this.url, this.date, this.sol});

  @override
  Widget build(BuildContext context) {
    // print(date);
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Container(
            height: 5 * boxSizeV,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SOL: $sol",
                ),
                Text(
                  "Date on Earth: $date",
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image(
              width: 100 * boxSizeH,
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
