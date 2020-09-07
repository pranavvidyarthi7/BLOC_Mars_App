import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mar_rover/PageResizing/Variables.dart';
import 'package:mar_rover/PageResizing/WidgetResizing.dart';
import 'package:http/http.dart' as http;
import 'package:mar_rover/screens/MainPage.dart';
import 'package:mar_rover/screens/welcome_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8 * boxSizeV),
          child: AppBar(
            centerTitle: true,
            title: Text('Mars Rover Image'),
            actions: [
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                },
                child: Container(
                  child: Icon(Icons.exit_to_app),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: 92 * boxSizeV,
          width: 100 * boxSizeH,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // border: Border.all(),
                    ),
                height: 8 * boxSizeV,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 8 * boxSizeV,
                        width: 100 / 3 * boxSizeH,
                        child: Text('Curiosity'),
                        decoration: BoxDecoration(
                          color: i == 0 ? Colors.black : Colors.black26,
                        ),
                      ),
                      onTap: () {
                        print('object1');
                        setState(() {
                          i = 0;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Oppurtunity'),
                        height: 8 * boxSizeV,
                        width: 100 / 3 * boxSizeH,
                        decoration: BoxDecoration(
                          color: i == 1 ? Colors.black : Colors.black26,
                        ),
                      ),
                      onTap: () {
                        print('object2');
                        setState(() {
                          i = 1;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Spirit'),
                        height: 8 * boxSizeV,
                        width: 100 / 3 * boxSizeH,
                        decoration: BoxDecoration(
                          color: i == 2 ? Colors.black : Colors.black26,
                        ),
                      ),
                      onTap: () {
                        print('object3');
                        setState(() {
                          i = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 84 * boxSizeV,
                child: AnimatedSwitcher(
                  key: ValueKey<int>(i),
                  duration: Duration(seconds: 1),
                  child: i == 0
                      ? MainPage('curiosity')
                      : i == 1 ? MainPage('opportunity') : MainPage('spirit'),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
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
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Row(
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
