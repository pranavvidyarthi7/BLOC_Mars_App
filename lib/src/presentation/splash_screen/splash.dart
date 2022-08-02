import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_app/src/presentation/home_screen/home.dart';
import 'package:mars_rover_app/src/presentation/router/fade_transit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, fadeTransition(const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.delayed(const Duration(), () => false),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/galaxy.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Flexible(
                            child: AutoSizeText(
                              'Welcome\nTO',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 45),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              minFontSize: 12,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              'MARS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 45),
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.6,
                              maxLines: 3,
                              minFontSize: 12,
                            ),
                          )
                        ],
                      )),
                  const Flexible(
                    flex: 1,
                    child: AutoSizeText(
                      'Made By\nPranav Vidyarthi:101917139\nPranav Manchanda:101917004\nMudit Aggarwal:101917134\nAnkit Swami:101917142\n​​Komal Tayal:101917133',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      minFontSize: 8,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
