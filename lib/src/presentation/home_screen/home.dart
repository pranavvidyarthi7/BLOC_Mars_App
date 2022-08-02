import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../rover_data_screen/rover_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  void changePage(String rover, BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => RoverDataScreen(rover: rover)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            bool exit = false;
            await Alert(
              style: const AlertStyle(
                  animationType: AnimationType.grow,
                  isCloseButton: false,
                  overlayColor: Colors.black54),
              context: context,
              title: "Are You Leaving??",
              image: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/gif/sad_face.gif',
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    exit = true;
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: const Text(
                    "EXIT",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.green,
                  child: const Text(
                    "STAY",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
            if (exit) {
              await SystemChannels.platform
                  .invokeMethod<void>('SystemNavigator.pop');
            }
            return false;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/galaxy.jpeg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const AutoSizeText(
                      'Select Your Rover',
                      style: TextStyle(color: Colors.white, fontSize: 45),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 12,
                    ),
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: OutlinedButton(
                            onPressed: () {
                              changePage('Curiosity', context);
                            },
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Colors.red, width: 3),
                                shape: const StadiumBorder()),
                            child: const Hero(
                              tag: 'Curiosity',
                              child: Material(
                                type: MaterialType.transparency,
                                textStyle:
                                    TextStyle(color: Colors.red, fontSize: 25),
                                child: AutoSizeText(
                                  'Curiosity',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 25),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )),
                        Flexible(
                            child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: OutlinedButton(
                            onPressed: () {
                              changePage('Spirit', context);
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.red,
                                side: const BorderSide(
                                    color: Colors.red, width: 3),
                                shape: const StadiumBorder()),
                            child: const Hero(
                              tag: 'Spirit',
                              child: Material(
                                type: MaterialType.transparency,
                                textStyle:
                                    TextStyle(color: Colors.red, fontSize: 25),
                                child: AutoSizeText(
                                  'Spirit',
                                  style: TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )),
                        Flexible(
                            child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: OutlinedButton(
                            onPressed: () {
                              changePage('Opportunity', context);
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.red,
                                side: const BorderSide(
                                    color: Colors.red, width: 3),
                                shape: const StadiumBorder()),
                            child: const Hero(
                              tag: 'Opportunity',
                              child: Material(
                                type: MaterialType.transparency,
                                child: AutoSizeText(
                                  'Opportunity',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
