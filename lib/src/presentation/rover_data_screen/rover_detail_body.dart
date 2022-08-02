import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_app/src/data/models/rover_detail_model.dart';
import 'package:mars_rover_app/src/data/repositories/rover_data_repository.dart';
import 'package:mars_rover_app/src/presentation/rover_data_screen/rover_detail_pics.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RoverDetailBody extends StatefulWidget {
  final String rover;
  const RoverDetailBody({Key? key, required this.rover}) : super(key: key);

  @override
  _RoverDetailBodyState createState() => _RoverDetailBodyState();
}

class _RoverDetailBodyState extends State<RoverDetailBody> {
  Future<RoverDetail?> getRoverData(BuildContext ctx) async {
    if (roverDetailMap.containsKey(widget.rover)) {
      return roverDetailMap[widget.rover];
    } else {
      final RoverDetail roverDetail =
          await Provider.of<RoverDataRepository>(context)
              .getRoverManifest(roverName: widget.rover);
      roverDetailMap[widget.rover] = roverDetail;
      return roverDetail;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder<RoverDetail?>(
          future: getRoverData(context),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.black54,
                              child: Card(
                                color: Colors.transparent,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.black54,
                              child: Card(
                                color: Colors.transparent,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.black54,
                              child: Card(
                                color: Colors.transparent,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.black54,
                                    child: Card(
                                      color: Colors.transparent,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.black54,
                                    child: Card(
                                      color: Colors.transparent,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.black54,
                                    child: Card(
                                      color: Colors.transparent,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: constraints.maxWidth ~/ 250,
                              ),
                              itemCount: 5,
                              itemBuilder: (_, i) => Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.black54,
                                child: const Card(
                                  color: Colors.transparent,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data != null) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Pics',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.totalPics,
                                              style: const TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Sol',
                                              style: TextStyle(
                                                  color: Colors.lime,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.maxSol,
                                              style: const TextStyle(
                                                  color: Colors.lime,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Date',
                                              style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.maxDate,
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: RoverDetailPicsBody(roverName: widget.rover),
                      ),
                    ],
                  );
                } else {
                  print(snapshot.error);
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: TextButton(
                      child: const Text('Retry'),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  return Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Pics',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.totalPics,
                                              style: const TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Sol',
                                              style: TextStyle(
                                                  color: Colors.lime,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.maxSol,
                                              style: const TextStyle(
                                                  color: Colors.lime,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: const AutoSizeText(
                                              'Max Date',
                                              style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: AutoSizeText(
                                              snapshot.data!.manifest.maxDate,
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: RoverDetailPicsBody(roverName: widget.rover),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
            }
          },
        );
      },
    );
  }
}
