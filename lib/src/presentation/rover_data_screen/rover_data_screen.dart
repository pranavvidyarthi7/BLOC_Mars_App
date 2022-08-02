import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_app/src/presentation/rover_data_screen/rover_detail_body.dart';

class RoverDataScreen extends StatelessWidget {
  final String rover;
  const RoverDataScreen({Key? key, required this.rover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.delayed(const Duration(), () => true),
      child: SafeArea(
        child: Scaffold(
          body: Container(
              padding: const EdgeInsets.only(top: 12),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/galaxy.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 0,
                    child: Hero(
                      tag: rover,
                      child: Material(
                        type: MaterialType.transparency,
                        child: AutoSizeText(
                          '$rover Rover',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 30),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RoverDetailBody(
                      rover: rover,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
